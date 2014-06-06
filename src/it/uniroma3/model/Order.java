package it.uniroma3.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@NamedQuery(name = "findAllOrders", query = "SELECT o FROM Order o")
@Table (name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private boolean chiuso; //Stato chiuso dell'ordine
	
	@Column
	private boolean evaso; //Stato chiuso dell'ordine
	
	@Column
	@Temporal (TemporalType.DATE)
	private Date creationTime; //data di creazione dell'ordine
	
	@Column
	@Temporal (TemporalType.DATE)
	private Date completedTime; //data di chiusura dell'ordine
	
	@Column
	@Temporal (TemporalType.DATE)
	private Date processedTime; //data di evasione (spedizione) dell'ordine
	
	@ManyToOne
	private Customer customer;
	
	@OneToMany
	private List<OrderLine> orderLines;

	public Order (Date creationTime, Customer customer) {
    	this.creationTime = creationTime;
    	this.customer = customer;
    	this.chiuso = false; //Alla creazione, l'ordine è ancora aperto
    	this.orderLines = new ArrayList<OrderLine>();
    }
	
	public void addOrderLine(OrderLine orderLine) {
		this.orderLines.add(orderLine);
	}
	
	// ***** Getters and setters *****
	
	public Long getId() {
		return id;
	}

	public boolean isChiuso() {
		return chiuso;
	}

	public void setChiuso() {
		this.chiuso = true;
	}
	
	public boolean isEvaso() {
		return evaso;
	}

	public void setEvaso() {
		this.evaso = true;
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
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}
}
