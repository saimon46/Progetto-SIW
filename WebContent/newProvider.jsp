<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Nuovo Fornitore</title>
</head>
<body>
<f:view>
<h:form id="addingProvider">
<table border="2">
	<tr>
		<td><h2> Inserimento FORNITORE nel DataBase</h2></td> 
	</tr>
	<tr>	
		<td>
			<div>Nome: <h:inputText value="#{providerController.name}" 
                     required="true"
                     requiredMessage="*"
                     id="name"/> <h:message for="name" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>E-mail: <h:inputText value="#{providerController.email}" 
                     required="true"
                     requiredMessage="*"
                     id="email"/> <h:message for="email" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Telefono: <h:inputText value="#{providerController.phoneNumber}" 
                     required="true"
                     requiredMessage="*"
                     id="phoneNumber"/> <h:message for="phoneNumber" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Partita IVA: <h:inputText value="#{providerController.vatin}" 
                     required="true"
                     requiredMessage="*"
                     id="vatin"/> <h:message for="vatin" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Via/Piazza: <h:inputText value="#{providerController.street}" 
                     required="true"
                     requiredMessage="*"
                     id="address_street"/> <h:message for="address_street" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>CAP: <h:inputText value="#{providerController.zipcode}" 
                     required="true"
                     requiredMessage="*"
                     id="address_zipcode"/> <h:message for="address_zipcode" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Citta': <h:inputText value="#{providerController.city}" 
                     required="true"
                     requiredMessage="*"
                     id="address_city"/> <h:message for="address_city" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Provincia: <h:inputText value="#{providerController.country}" 
                     required="true"
                     requiredMessage="*"
                     id="address_country"/> <h:message for="address_country" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Nazione: <h:inputText value="#{providerController.state}" 
                     required="true"
                     requiredMessage="*"
                     id="address_state"/> <h:message for="address_state" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div>
			<h:commandButton id="addProvider" value="Salva"
				action="#{providerController.createProvider}"/>
			<h:message for="addProvider" styleClass="error"/>
			</div>
		</td>
	</tr>
</table>
</h:form>
	<ul>
			<li><a href='<c:url value="/faces/index.jsp" />'>Torna alla Pagina Iniziale</a></li>
	</ul>	
</f:view>		
</body>
</html>