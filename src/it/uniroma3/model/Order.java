package it.uniroma3.model;

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
    }
	
	// ***** Getters and setters *****
	
	public Long getId() {
		return id;
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
}
