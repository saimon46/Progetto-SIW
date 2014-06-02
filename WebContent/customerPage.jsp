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
			<h4> ${customerController.currentCustomer.firstName}, cosa vuoi fare? </h4>
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
		<ul><li><a href='<c:url value="/faces/customerInfo.jsp" />'>Verifica i miei dati Utente</a></li></ul>
		</td>
	</tr>	
	
	<tr>
		<td>
	<c:choose>
		<c:when test="${customerController.lastOrder == null}">
				<h:commandLink action="#{orderController.createOrder}"
					value="APRI un Nuovo ORDINE" />
		</c:when>
		<c:otherwise>
			<h:commandLink action="#{orderController.openLastOrder}"
					value="VAI all'ultimo ordine aperto" />
		</c:otherwise>
	</c:choose>
		</td>
	</tr>
</table>
<br>
</h:form>
</f:view>
</body>
</html>