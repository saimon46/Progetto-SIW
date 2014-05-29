package it.uniroma3.controller;

import java.util.Date;
import java.util.List;

import it.uniroma3.model.Address;
import it.uniroma3.model.Customer;
import it.uniroma3.model.CustomerFacade;
import it.uniroma3.model.Order;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class CustomerController {
	
	private String firstName;
	private String lastName;
	private String password;
	private Address address;
	private String email;
	private String phoneNumber;
	private Date dateOfBirth;
	private Date registrationDate;
	private List<Order> orders;
	private Customer customer;
	
	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;
	
	public String createCustomer() {
		this.customer = customerFacade.createCustomer(firstName, lastName, password, email, phoneNumber, dateOfBirth, address, registrationDate);
		return "customer";
	}

	public String listOrders() {
		this.orders = customerFacade.getAllOrders(customer);
		return "products";
	}
	
	public String loginCustomer() {
		
		try{
			Customer customer = customerFacade.getCustomerByEmail(email);
			if (customer.verificaPassword(this.password)) {
				setCustomer(customer);
				return "customerPage";
			}
			else{
				// Password Errata
				FacesContext.getCurrentInstance().addMessage("loginCustomer:accedi", new FacesMessage("Login Errato!"));
				return "index";
			}
		}
		catch (Exception e) {
			// Cliente non trovato
			FacesContext.getCurrentInstance().addMessage("loginCustomer:accedi", new FacesMessage("Login Errato!"));
			return "index";
		}
	}
	
	public String logoutCustomer() {
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		return "index";
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
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

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}