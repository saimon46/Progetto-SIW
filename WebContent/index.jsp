<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Negozio Online</title>
</head>
<body>

<f:view>
<h1>Negozio di acquisti online</h1>
<h3>Benvenuto Visitatore</h3>
<h:form id="loginCustomer">
<table border="2">
	<tr>
		<td>
			<div><h2> Login UTENTE</h2></div>
			<div><h4>oppure <a href='<c:url value="/faces/customerRegistration.jsp" />'>Registrati</a></h4></div></td>		 
	</tr>
	<tr>	
		<td>
			<div>E-mail: <h:inputText value="#{customerController.email}" 
                     required="true"
                     requiredMessage="L'email e' obbligatoria!"
                     id="email"/> <h:message for="email" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Password: <h:inputSecret value="#{customerController.password}" 
                     required="true"
                     requiredMessage="La password e' obbligatoria!"
                     id="password"/> <h:message for="password" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div>
		<h:commandButton id="accedi" value="Accedi"
			action="#{customerController.loginCustomer}"/>
			<h:message for="accedi" styleClass="error"/>
			</div>
		</td>
	</tr>
	<tr>
		<td>
		<ul>
			<li><a href='<c:url value="/faces/loginAdministrator.jsp" />'>Vai all'Amministrazione</a></li>
		</ul>
		</td>
	</tr>	
</table>
</h:form>
	<ul>
			<h:form>
				<h:commandButton action="#{productController.listProducts}"
					value="Visualizza il catalogo dei Prodotti" />
			</h:form>
	</ul>
</f:view>		
</body>
</html>

