<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Amministratore Loggato</title>
</head>
<body>
<f:view>

<jsp:include page="header.jsp"/>

<h:form>
<table border="2">
	<tr>
		<td>
			<h4> Operazioni d'amministrazione disponibili </h4>
		</td>		 
	</tr>
	
	<tr>
		<td>
		<ul><li><h:commandLink action="#{productController.listProducts}" 
				value="CATALOGO Prodotti in Negozio" /></li></ul>
		</td>
	</tr>
	
	<tr>
		<td>
		<ul><li>
		<h:commandLink action="#{administratorController.newProduct}"
					value="Inserisci un Nuovo Prodotto" />
		</li></ul>
		</td>
	</tr>

	<tr>
		<td>
		<ul><li><a href='<c:url value="/faces/newProvider.jsp" />'>Inserisci un Nuovo Fornitore</a></li></ul>
		</td>
	</tr>
	
	<tr>
		<td>
		<ul><li>
		<a href='<c:url value="/faces/customerRegistrationByAdmin.jsp" />'>Registra un Nuovo Utente</a>
		</li></ul>
		<ul><li>
		<h:commandLink action="#{customerController.listCustomers}"
					value="Lista degli Utenti Registrati" />
		</li></ul>
		</td>
	</tr>
</table>
<br>
</h:form>
</f:view>
</body>
</html>