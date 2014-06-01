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
<h1>Amministratore collegato: ${administratorController.administrator.nickname}</h1>

<h:form>
<table border="2">
	<tr>
		<td>
			<h4> Operazioni d'amministrazione disponibili </h4>
		</td>		 
	</tr>
	<tr>
		<td>
		<ul><li><a href='<c:url value="/faces/newProduct.jsp" />'>Inserisci Nuovo Prodotto nel DB</a></li></ul>
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

	<tr>
		<td>
		<ul><li><a href='<c:url value="/faces/xxx.jsp" />'>Operazione 3</a></li></ul>
		</td>
	</tr>

	<tr>
		<td>
		<ul><li><a href='<c:url value="/faces/xxx.jsp" />'>Operazione 4</a></li></ul>
		</td>
	</tr>

	<tr>
		<td>
		<ul><li><h:commandLink action="#{productController.listProducts}" 
				value="Controlla i Prodotti in Negozio" /></li></ul>
		</td>
	</tr>
</table>
<br>
</h:form>

<div>
<h:form>
	<h:commandButton value="Logout"  action="#{administratorController.logoutAdministrator}"/>
</h:form>
</div>
</f:view>
</body>
</html>