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
<c:choose>
	<c:when test="${administratorController.currentAdministrator == null && customerController.currentCustomer == null}">
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
		</table>
		</h:form>
	</c:when>
	<c:otherwise>
		<c:if test="${administratorController.currentAdministrator != null}">
		<p>
			<div>
			<h4><a href='<c:url value="/faces/administratorPage.jsp" />'>
			<c:out value="Amministratore loggato: ${administratorController.currentAdministrator.nickname}  "/>
			</a></h4>
			</div>
			<h:form>
				<h:commandButton value="Logout"  action="#{administratorController.logoutAdministrator}"/>
			</h:form>
		<p>
		</c:if>
		<c:if test="${customerController.currentCustomer != null}">
		<p>
			<div>
			<h4><a href='<c:url value="/faces/customerPage.jsp" />'>
				<c:out value="Cliente loggato: ${customerController.currentCustomer.firstName} ${customerController.currentCustomer.lastName}  "/>
			</a></h4>
			</div>
			<h:form>
				<h:commandButton value="Logout"  action="#{customerController.logoutCustomer}"/>
			</h:form>
		<p>
		</c:if>
	</c:otherwise>
</c:choose>
<br>
<a href='<c:url value="/faces/loginAdministrator.jsp" />'>Vai all'Amministrazione</a>
<h:form>
	<br>
	<h:commandButton action="#{productController.listProducts}"
		value="Visualizza il catalogo dei Prodotti" />
</h:form>
</f:view>		
</body>
</html>

