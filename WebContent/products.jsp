<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Lista Prodotti</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>

<c:if test="${orderController.order != null}">
<p>
	<h3>Nuovo ordine aperto correttamente!</h3>
	<h4>Segue la lista dei prodotti, clicca sui nomi dei prodotti desiderati per aggiungerli
			al tuo ordine</h4>
<p>
</c:if>

<h1>Catalogo Prodotti:</h1>
<h:form>
<table>
	<tr>
		<th>Nome</th><th>Prezzo</th><th>Quantità</th>
	</tr>
	<c:forEach var="product" items="#{productController.products}">
		<tr><td>
		<h:commandLink action="#{productController.findProduct}" value="#{product.name}">
			<f:param name="id" value="#{product.id}" />
		</h:commandLink>
		</td><td>${product.price}</td><td>${product.quantity}</td></tr>
	</c:forEach>
</table>
</h:form>

<br>

<a href='<c:url value="/faces/index.jsp" />'>Vai alla HomePage</a>

</f:view>
</body>
</html>