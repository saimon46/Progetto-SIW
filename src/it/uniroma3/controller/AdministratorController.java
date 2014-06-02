package it.uniroma3.controller;

import java.util.Date;

import it.uniroma3.model.Administrator;
import it.uniroma3.model.AdministratorFacade;
import it.uniroma3.model.CustomerFacade;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class AdministratorController {
	
	/*Dati per la registrazione di un nuovo utente da parte dell'amministratore */
	private String firstName, lastName, passwordCustomer, email, phoneNumber, street, city, state, zipcode, country;
	private Date dateOfBirth, registrationDate;
	
	private String nickname;
	private String password;
	private Administrator currentAdministrator;
	
	@EJB(beanName="administratorFacade")
	private AdministratorFacade administratorFacade;
	
	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;
	
	public String createAdministrator() {
		this.currentAdministrator = administratorFacade.createAdministrator(nickname, password);
		return "administratorPage";
	}
	
	public String loginAdministrator() {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("customerController");
		try{
			Administrator administrator = administratorFacade.getAdministratorByNickname(nickname);
			if (administrator.verificaPassword(this.password)) {
				setCurrentAdministrator(administrator);
				return "administratorPage";
			}
			else{
				// Password Errata
				FacesContext.getCurrentInstance().addMessage("loginAdministrator:accediAdmin", new FacesMessage("Login Errato!"));
				return "loginAdministrator";
			}
		}
		catch (Exception e) {
			// Amministratore non trovato
			FacesContext.getCurrentInstance().addMessage("loginAdministrator:accediAdmin", new FacesMessage("Login Errato!"));
			return "loginAdministrator";
		}
	}
	
	public String createCustomer() {
		try{
			/*Genera automaticamente la data di oggi */
			this.registrationDate = new Date();
			customerFacade.createCustomer(firstName, lastName, passwordCustomer, email, phoneNumber, dateOfBirth, street, city, state, zipcode, country, registrationDate);
			this.resetCustomer();
			return "registrationDoneByAdmin";
		}catch(Exception e){
			/*Utente già registrato*/
			this.resetCustomer();
			FacesContext.getCurrentInstance().addMessage("registrationCustomer:signinCustomer", new FacesMessage("Utente già registrato!"));
			return "customerRegistrationByAdmin";
		}
	}
	
	private void resetCustomer(){
		this.firstName = null;
		this.lastName = null;
		this.passwordCustomer = null;
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
		
	public String logoutAdministrator() {
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		return "index";
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Administrator getCurrentAdministrator() {
		return currentAdministrator;
	}

	public void setCurrentAdministrator(Administrator administrator) {
		this.currentAdministrator = administrator;
	}

	//Seguono i Getters e Setters dei dati del nuovo customer
	
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

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPasswordCustomer() {
		return passwordCustomer;
	}

	public void setPasswordCustomer(String passwordCustomer) {
		this.passwordCustomer = passwordCustomer;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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
}