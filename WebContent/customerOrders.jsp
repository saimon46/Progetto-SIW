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
<h1>Lista ordini:</h1>
<h:form>
<table>
	<tr>
		<th>ID</th><th>Chiuso</th><th>Evaso</th>
	</tr>
	<c:forEach var="order" items="#{orderController.orders}">
		<tr><td>
		${order.id}
		</td><td>${order.chiuso}</td><td>${order.evaso}</td></tr>
	</c:forEach>
</table>
</h:form>

<br>
<c:if test="${orderController.currentOrder != null}">
<p>
	<a href='<c:url value="/faces/order.jsp" />'><c:out value="Torna all'ordine"/></a>
<p>
</c:if>

<a href='<c:url value="/faces/index.jsp" />'>Vai alla HomePage</a>

</f:view>
</body>
</html>