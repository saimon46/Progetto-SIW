package it.uniroma3.controller;

import java.util.Date;
import java.util.List;

import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean
@SessionScoped
public class OrderController {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	private boolean chiuso;
	private Date creationTime, completedTime, processedTime;
	private Order order;
	
	@ManagedProperty (value="#{sessionScope['customerController'].currentCustomer}")
	private Customer currentCustomer;
	
	private List<Order> orders;
	
	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;
	
	public String createOrder() {
		this.order = orderFacade.createOrder(new Date(), this.currentCustomer);
		return "orderJustOpened"; 
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
		this.order = orderFacade.getOrder(id);
		return "order";
	}
	
	public String findOrder(Long id) {
		this.order = orderFacade.getOrder(id);
		return "order";
	}

	public boolean isChiuso() {
		return chiuso;
	}

	public void setChiuso(boolean chiuso) {
		this.chiuso = chiuso;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public Date getCompletedTime() {
		return completedTime;
	}

	public void setCompletedTime(Date completedTime) {
		this.completedTime = completedTime;
	}

	public Date getProcessedTime() {
		return processedTime;
	}

	public void setProcessedTime(Date processedTime) {
		this.processedTime = processedTime;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
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
}