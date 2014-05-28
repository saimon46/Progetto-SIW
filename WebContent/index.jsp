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
		<ul>
			<li><a href='<c:url value="/faces/loginCustomer.jsp" />'>Login Utente</a></li>
			<li><a href='<c:url value="/faces/loginAdministrator.jsp" />'>Login Amministratore</a></li>
			<li><h:form>
					<h:commandLink action="#{productController.listProducts}"
						value="Visualizza il catalogo dei Prodotti" />
				</h:form></li>
		</ul>
	</f:view>				
</body>
</html>

