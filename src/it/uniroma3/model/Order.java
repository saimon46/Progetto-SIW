package it.uniroma3.model;

import java.util.ArrayList;
import java.util.Calendar;
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
	private boolean evaso; //Stato evaso dell'ordine
	
	@Column
	@Temporal (TemporalType.TIMESTAMP)
	private Calendar creationTime; //data di creazione dell'ordine
	
	@Column
	@Temporal (TemporalType.TIMESTAMP)
	private Calendar completedTime; //data di chiusura dell'ordine
	
	@Column
	@Temporal (TemporalType.TIMESTAMP)
	private Calendar processedTime; //data di evasione (spedizione) dell'ordine
	
	@ManyToOne
	private Customer customer;
	
	@JoinColumn(name="order_id")
	@OneToMany(fetch=FetchType.EAGER, cascade = CascadeType.REMOVE)
	private List<OrderLine> orderLines;

	public Order (Calendar creationTime, Customer customer) {
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

	public Calendar getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Calendar creationTime) {
		this.creationTime = creationTime;
	}

	public Calendar getCompletedTime() {
		return completedTime;
	}

	public void setCompletedTime(Calendar completedTime) {
		this.completedTime = completedTime;
	}

	public Calendar getProcessedTime() {
		return processedTime;
	}

	public void setProcessedTime(Calendar processedTime) {
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
	
	// metodo per trovare una riga d'ordine in base al prodotto
	public OrderLine checkOrderLine(Product product) {
		OrderLine orderLine = null;
		for(OrderLine line : this.orderLines){
			if(line.getProduct().getId().equals(product.getId()))
				orderLine = line;
		}
		return orderLine;
	}
}
