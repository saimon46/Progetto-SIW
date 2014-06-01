package it.uniroma3.controller;

import java.util.Date;
import java.util.List;

import it.uniroma3.model.Customer;
import it.uniroma3.model.CustomerFacade;
import it.uniroma3.model.Order;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class CustomerController {

	private String firstName, lastName, password, email, phoneNumber, street, city, state, zipcode, country;
	private Date dateOfBirth, registrationDate;
	private List<Order> orders;
	private List<Customer> customers; //Tutti gli utenti registrati

	private Customer customer;

	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;

	public String createCustomer() {
		try{
			/*Genera automaticamente la data di oggi */
			this.registrationDate = new Date();
			this.customer = customerFacade.createCustomer(firstName, lastName, password, email, phoneNumber, dateOfBirth, street, city, state, zipcode, country, registrationDate);
			return "registrationDone";
		}catch(Exception e){
			/*Utente già registrato*/
			this.resetCustomer();
			FacesContext.getCurrentInstance().addMessage("registrationCustomer:signinCustomer", new FacesMessage("Utente già registrato!"));
			return "customerRegistration";
		}
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
<<<<<<< HEAD

=======
	
>>>>>>> e02124798f79bdd91538b5cbe9f82fc0f621774a
	public boolean isLogged() {
		if (this.customer != null)
			return true;
		else
			return false;
	}
<<<<<<< HEAD

=======
	
>>>>>>> e02124798f79bdd91538b5cbe9f82fc0f621774a
	public String logoutCustomer() {
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		return "index";
	}

	private void resetCustomer(){
		this.firstName = null;
		this.lastName = null;
		this.password = null;
		this.email = null;
		this.phoneNumber = null;
		this.street = null;
		this.city = null;
		this.state = null;
		this.zipcode = null;
		this.country = null;
		this.dateOfBirth = null;
		this.registrationDate = null;
	}

	public String listCustomers() {
		this.customers = customerFacade.getAllCustomers();
		return "allCustomers";
	}

	public String findCustomer() {
		this.customer = customerFacade.getCustomer(email);
		return "customerInfo";
	}
<<<<<<< HEAD

=======
	
>>>>>>> e02124798f79bdd91538b5cbe9f82fc0f621774a
	public String findCustomer(String email) {
		this.customer = customerFacade.getCustomer(email);
		return "customerInfo";
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


	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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