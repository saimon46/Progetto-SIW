package it.uniroma3.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@NamedQuery(name = "findAllCustomers", query = "SELECT c FROM Customer c")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String firstName;

	@Column
	private String lastName;
	
	@Column(nullable = false)
	private String password;
	
	@Column(unique = true)
	private String email;
	
	@Column
	private String phoneNumber;
	
	@Temporal (TemporalType.DATE)
	private Date dateOfBirth;
	
	@Temporal (TemporalType.TIMESTAMP)
	private Calendar registrationDate;
	
	@OneToOne(fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Address address;
	
	@OneToMany(mappedBy="customer", fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	private List<Order> orders;
	
	public Customer () {
		
	}

	public Customer (String firstName, String lastName, String password, String email, String phoneNumber, Date dateOfBirth, Address address, Calendar registrationDate) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.dateOfBirth = dateOfBirth;
		this.registrationDate = registrationDate;
		this.address = address;
		this.orders = new ArrayList<Order>();
	}
	
	public boolean verificaPassword(String password) {
		return this.password.equals(password);
	}
	
	public void addOrder(Order order) {
		this.orders.add(order);
	}
		
	// ***** Getters and setters *****
	
	public Long getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Calendar getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Calendar registrationDate) {
		this.registrationDate = registrationDate;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
}
