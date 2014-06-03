package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.Provider;
import it.uniroma3.model.ProviderFacade;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean
public class ProviderController {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	private String name, email, phoneNumber, vatin;
	private String street, city, state, zipcode, country; //address
	private List<Product> products; //Prodotti forniti
	private Provider provider;
	
	@EJB(beanName="providerFacade")
	private ProviderFacade providerFacade;
	
	public String createProvider() {
		try{
			this.provider = providerFacade.createProvider(name, phoneNumber, email, vatin, street, city, state, zipcode, country);
			return "providerAdded";
		}catch(Exception e){
			/*Eccezione del DB*/
			this.resetProvider();
			FacesContext.getCurrentInstance().addMessage("addingProvider:addProvider", new FacesMessage("Errore salvataggio!"));
			return "addingProvider";
		}
	}
	
	private void resetProvider() {
		this.name = null;
		this.email = null;
		this.phoneNumber = null;
		this.vatin = null;
		this.street = null;
		this.city = null;
		this.state = null;
		this.zipcode = null;
		this.country = null;
	}

	public String listProducts() {
		this.products = provider.getProducts();
		return "providerProducts";
	}
	
	public String findProvider() {
		this.provider = providerFacade.getProvider(name);
		return "providerInfo";
	}

	public String findProvider(String name) {
		this.provider = providerFacade.getProvider(name);
		return "providerInfo";
	}
	
	/* Getters e Setters */

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getVatin() {
		return vatin;
	}

	public void setVatin(String vatin) {
		this.vatin = vatin;
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

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	
}
