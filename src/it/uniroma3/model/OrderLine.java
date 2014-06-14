package it.uniroma3.model;

import javax.persistence.*;

@Entity
public class OrderLine {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private float unitPrice;
	
	@Column
	private int quantity;
	
	@OneToOne(fetch=FetchType.EAGER)
	private Product product;
	
	public OrderLine() {
		
	}

    public OrderLine(float unitPrice, int quantity, Product product) {
    	this.unitPrice = unitPrice;
    	this.quantity = quantity;
    	this.product = product;
    }

	// ***** Getters and setters *****
	
	public Long getId() {
		return id;
	}
	
	public float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
