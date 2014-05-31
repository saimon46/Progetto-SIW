<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Nuovo Utente</title>
</head>
<body>
<f:view>
<h:form id="registrationCustomerByAdmin">
<table border="2">
	<tr>
		<td><h2> Registrazione UTENTE</h2></td> 
	</tr>
	<tr>	
		<td>
			<div>Nome: <h:inputText value="#{administratorController.firstName}" 
                     required="true"
                     requiredMessage="*"
                     id="firstName"/> <h:message for="firstName" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div>Cognome: <h:inputText value="#{administratorController.lastName}" 
                     required="true"
                     requiredMessage="*"
                     id="lastName"/> <h:message for="lastName" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>E-mail: <h:inputText value="#{administratorController.email}" 
                     required="true"
                     requiredMessage="*"
                     id="email"/> <h:message for="email" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Password: <h:inputSecret value="#{administratorController.passwordCustomer}" 
                     required="true"
                     requiredMessage="*"
                     id="passwordCustomer"/> <h:message for="passwordCustomer" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Data di Nascita: <t:inputDate value="#{administratorController.dateOfBirth}" 
                     required="true"
					 requiredMessage="*"
                     id="dateOfBirth"/> <h:message for="dateOfBirth" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Telefono: <h:inputText value="#{administratorController.phoneNumber}" 
                     required="true"
                     requiredMessage="*"
                     id="phoneNumber"/> <h:message for="phoneNumber" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Via/Piazza: <h:inputText value="#{administratorController.street}" 
                     required="true"
                     requiredMessage="*"
                     id="address_street"/> <h:message for="address_street" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>CAP: <h:inputText value="#{administratorController.zipcode}" 
                     required="true"
                     requiredMessage="*"
                     id="address_zipcode"/> <h:message for="address_zipcode" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Citta': <h:inputText value="#{administratorController.city}" 
                     required="true"
                     requiredMessage="*"
                     id="address_city"/> <h:message for="address_city" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Provincia: <h:inputText value="#{administratorController.country}" 
                     required="true"
                     requiredMessage="*"
                     id="address_country"/> <h:message for="address_country" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Nazione: <h:inputText value="#{administratorController.state}" 
                     required="true"
                     requiredMessage="*"
                     id="address_state"/> <h:message for="address_state" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div>
		<h:commandButton id="signinCustomerByAdmin" value="Registra"
			action="#{administratorController.createCustomer}"/>
			<h:message for="signinCustomerByAdmin" styleClass="error"/>
			</div>
		</td>
	</tr>
</table>
</h:form>

	<ul>
			<li><a href='<c:url value="/faces/administratorPage.jsp" />'>Torna alla Pagina d'Amministrazione</a></li>
	</ul>	
</f:view>		
</body>
</html>
