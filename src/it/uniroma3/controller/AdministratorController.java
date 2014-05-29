package it.uniroma3.controller;

import it.uniroma3.model.Administrator;
import it.uniroma3.model.AdministratorFacade;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class AdministratorController {
	
	private String nickname;
	private String password;
	private Administrator administrator;
	
	@EJB(beanName="administatorFacade")
	private AdministratorFacade administratorFacade;
	
	public String createAdministrator() {
		this.administrator = administratorFacade.createAdministrator(nickname, password);
		return "administratorPage";
	}
	
	public String loginAdministrator() {
		try{
			Administrator administrator = administratorFacade.getAdministratorByNickname(nickname);
			if (administrator.verificaPassword(this.password)) {
				setAdministrator(administrator);
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
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}

	public String logoutAdministrator() {
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		return "index";
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Administrator getAdministrator() {
		return administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}
}