package it.uniroma3.controller;

import java.util.Date;
import java.util.List;

import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.OrderLineFacade;
import it.uniroma3.model.Product;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean
public class OrderController {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	@ManagedProperty(value="#{sessionScope['currentOrder']}")
	private Order currentOrder;
	
	@ManagedProperty(value="#{sessionScope['currentProduct']}")
	private Product currentProduct;

	@ManagedProperty(value="#{sessionScope['customerController'].currentCustomer}")
	private Customer currentCustomer;
	
	private String message;
	private int quantity; // quantità della riga d'ordine appena inserita
	private List<Order> orders;
	
	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;
	
	@EJB(beanName="orderLineFacade")
	private OrderLineFacade orderLineFacade;
	
	public String createOrder() {
		this.currentOrder = orderFacade.createOrder(new Date(), this.currentCustomer);
		this.currentCustomer.addOrder(this.currentOrder);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentOrder", this.currentOrder);
		return "order";
	}
	
	public String addOrderLine() {
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
		return "order";
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
		return "order";
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
}