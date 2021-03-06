package it.uniroma3.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import it.uniroma3.model.Customer;
import it.uniroma3.model.CustomerFacade;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.OrderLineFacade;
import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean
public class OrderController {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	@ManagedProperty(value="#{param.orderLineId}")
	private Long orderLineId;
	
	@ManagedProperty(value="#{sessionScope['currentOrder']}")
	private Order currentOrder;
	
	@ManagedProperty(value="#{sessionScope['currentProduct']}")
	private Product currentProduct;

	@ManagedProperty(value="#{sessionScope['customerController'].currentCustomer}")
	private Customer currentCustomer;
	
	private String message;
	private int quantity = 1; // quantità della riga d'ordine appena inserita
	private List<Order> orders;
	
	/* Questa lista conterra' i codici dei prodotti delle righe ordine con una quantita'
	 *  inferiore alle disponibilita' in magazzino */
	  	
	private List<String> codiceProdottiRigheOrdine = new ArrayList<String>() ; 
	
	private int quantityNew = 1;
	private String codeProductLineOrder = null;
	
	
	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;
	
	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;
	
	@EJB(beanName="orderLineFacade")
	private OrderLineFacade orderLineFacade;
	
	@EJB(beanName="productFacade")
	private ProductFacade productFacade;
	
	public String createOrder() {
		this.currentOrder = orderFacade.createOrder(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")), this.currentCustomer);
		this.currentCustomer.addOrder(this.currentOrder);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentOrder", this.currentOrder);
		return "order";
	}
	
	public String addOrderLine() {
		if(this.quantity<=0){
			this.message = "La quantità deve essere maggiore di 0";
		} else {
			this.message = "";
			OrderLine orderLine = this.currentOrder.checkOrderLine(currentProduct);
			if(orderLine != null){
				orderLine.setQuantity(orderLine.getQuantity()+this.quantity);
				// abbiamo deciso che il prezzo rimane quello che c'era al primo ordine
				orderLineFacade.updateOrderLine(orderLine);
				this.message = "Prodotto già associato a quest'ordine! Sono state sommate le quantità!";
			} else {
				orderLine = orderLineFacade.createOrderLine(currentProduct.getPrice(), this.quantity, currentProduct);
				this.currentOrder.addOrderLine(orderLine);
				orderFacade.updateOrder(currentOrder);
			}
		}
		return "order";
	}
	
	public String deleteOrderLine() {
		OrderLine orderLine = this.currentOrder.getOrderLineById(this.orderLineId);
		this.currentOrder.removeOrderLine(orderLine);
		orderLineFacade.deleteOrderLine(this.orderLineId);
		orderFacade.updateOrder(currentOrder);
		this.message = "Linea ordine rimossa!";
		return "order";
	}
	
	public String changeQuantityOrderLine() {
		if(this.quantityNew <=0){
			this.quantityNew = 1;
			this.message = "La quantità deve essere maggiore di 0";
		} else {
			List<OrderLine> orderLines = this.currentOrder.getOrderLines();
			for(OrderLine orderLine : orderLines){
			
				if(orderLine.getProduct().getCode().equals(this.codeProductLineOrder)){
					orderLine.setQuantity(this.quantityNew);
					orderLineFacade.updateOrderLine(orderLine);
					orderFacade.updateOrder(currentOrder);
					this.quantityNew = 1;
				}
			}
			this.message = "Quantità riga ordine modificata!";
		}
		return "order";
	}
	
	public String closeOrder() {
		List<OrderLine> orderLines = this.currentOrder.getOrderLines();
		if(orderLines.size() == 0){
			//Se non ho righe d'ordine nell'ordine, non posso chiuderlo!!!
			this.message = "Impossibile chiudere l'ordine, non hai scelto nessun prodotto!";
		}else{
			this.currentOrder.setCompletedTime(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")));
			this.currentOrder.setChiuso();
			orderFacade.updateOrder(currentOrder);
			customerFacade.updateCustomer(currentCustomer);
			this.message = "Ordine chiuso correttamente!";
		}
		return "order";
	}
	
	public String processedOrder() {
		if(this.checkOrderQuantity()){
			this.reduceOrderQuantity();
			this.currentOrder.setProcessedTime(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")));
			this.currentOrder.setEvaso();
			orderFacade.updateOrder(currentOrder);
			customerFacade.updateCustomer(currentCustomer);
			if(this.currentOrder.isProdottoCancellato()){
				this.message = "Ordine evaso correttamente, ma con un'avvertenza!";
				this.message+= "\nAvvertenza: Uno o più prodotti di quest'ordine non sono più in magazzino e non verranno evasi!";
				this.message+= "\nCome vedi non sono più presenti tra le righe d'ordine!";
			}else{
				this.message = "Ordine evaso correttamente!";
			}
		} else {
			this.message = "Ordine non evaso correttamente! Uno o più prodotti non sono disponibili nelle"
			+ " quantita' scelte! \nCodice Prodotti in righe d'ordine non evadibili: "+this.codiceProdottiRigheOrdine.toString();
		}
		return "orderDetails";
	}
	
	private boolean checkOrderQuantity() {
		this.codiceProdottiRigheOrdine.clear();
		List<OrderLine> orderLines = this.currentOrder.getOrderLines();
		for(OrderLine orderLine : orderLines){
			if(orderLine.getQuantity()>orderLine.getProduct().getQuantity()){
				this.codiceProdottiRigheOrdine.add(orderLine.getProduct().getCode());
			}
		}
		if(this.codiceProdottiRigheOrdine.size() == 0)
			return true;
		else
			return false;
	}
	
	private boolean reduceOrderQuantity() {
		List<OrderLine> orderLines = this.currentOrder.getOrderLines();
		for(OrderLine orderLine : orderLines){
			int quantityOriginal = orderLine.getProduct().getQuantity(); // quantità originale di magazzino del prodotto
			int quantityToReduce = orderLine.getQuantity(); // quantità da ridurre
			orderLine.getProduct().setQuantity(quantityOriginal-quantityToReduce);
			productFacade.updateProduct(orderLine.getProduct());
		}
		return true;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String listOrders() {
		this.orders = orderFacade.getAllOrder();
		return "allOrders"; 
	}

	public String findOrder() {
		this.currentOrder = orderFacade.getOrder(id);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentOrder", this.currentOrder);
		return "order";
	}
	
	public String findOrderByAdministrator() {
		this.findOrder();
		return "orderDetails";
	}
	
	public String findOrder(Long id) {
		this.currentOrder = orderFacade.getOrder(id);
		return "order";
	}

	public Order getCurrentOrder() {
		return currentOrder;
	}

	public void setCurrentOrder(Order order) {
		this.currentOrder = order;
	}

	public Customer getCurrentCustomer() {
		return currentCustomer;
	}

	public void setCurrentCustomer(Customer customer) {
		this.currentCustomer = customer;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public Product getCurrentProduct() {
		return currentProduct;
	}

	public void setCurrentProduct(Product currentProduct) {
		this.currentProduct = currentProduct;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public Long getOrderLineId() {
		return orderLineId;
	}

	public void setOrderLineId(Long orderLineId) {
		this.orderLineId = orderLineId;
	}

	public int getQuantityNew() {
		return quantityNew;
	}

	public void setQuantityNew(int quantityNew) {
		this.quantityNew = quantityNew;
	}

	public String getCodeProductLineOrder() {
		return codeProductLineOrder;
	}

	public void setCodeProductLineOrder(String codeProductLineOrder) {
		this.codeProductLineOrder = codeProductLineOrder;
	}

	public List<String> getCodiceProdottiRigheOrdine() {
		return codiceProdottiRigheOrdine;
	}

	public void setCodiceProdottiRigheOrdine(List<String> codiceProdottiRigheOrdine) {
		this.codiceProdottiRigheOrdine = codiceProdottiRigheOrdine;
	}

}