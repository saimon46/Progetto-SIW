<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Utente Loggato</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h:form>
<h:message for="customerPage" styleClass="error"/>
</h:form>
<br>
<h:form>
<table border="2">
	<tr>
		<td>
			<h4> ${customerController.customer.firstName}, cosa vuoi fare? </h4>
		</td>		 
	</tr>
	
	<tr>
		<td>
		<ul><li><h:commandLink action="#{productController.listProducts}"
						value="Controlla i Prodotti in Negozio" /></li></ul>
		</td>
	</tr>	
	<tr>
		<td>
		<ul><li><a href='<c:url value="/faces/customerInfo.jsp" />'>Verifica i miei dati</a></li></ul>
		</td>
	</tr>	
	
	<tr>
		<td>
		<ul><li><a href='<c:url value="/faces/xxx.jsp" />'>Operazione 3</a></li></ul>
		</td>
	</tr>
</table>
<br>
</h:form>
<h:form>
	<h:commandButton value="Logout"  action="#{customerController.logoutCustomer}"/>
</h:form>
</f:view>
</body>
</html>