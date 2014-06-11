<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Lista Prodotti</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<h1>Lista ordini:</h1>
		<h:form>
			<table>
				<tr>
					<th>ID-Ordine</th>
					<th>Cliente-Associato</th>
					<th>Data-Creazione</th>
					<th>Stato</th>
					<th>Data-Completamento</th>
					<th>Evaso</th>
					<th>Data-Evasione</th>
				</tr>
				<c:forEach var="order" items="#{administratorController.orders}">
					<tr>
						<td><h:commandLink action="#{orderController.findOrder}"
								value="#{order.id}">
								<f:param name="id" value="#{order.id}" />
							</h:commandLink></td>
							
						<td>${order.customer.email}</td>

						<td><h:outputText value="#{order.creationTime}">
								<f:convertDateTime dateStyle="medium" locale="it_IT" type="date" />
							</h:outputText></td>

						<td><c:choose>
								<c:when test="${order.chiuso == false}">Aperto</c:when>
								<c:otherwise>
								Completato
								</c:otherwise>
							</c:choose></td>

						<td><h:outputText value="#{order.completedTime}">
								<f:convertDateTime dateStyle="medium" locale="it_IT" type="date" />
							</h:outputText></td>

						<td><c:choose>
								<c:when test="${order.evaso == false}">NO</c:when>
								<c:otherwise>
							SI
							</c:otherwise>
							</c:choose></td>

						<td><h:outputText value="#{order.processedTime}">
								<f:convertDateTime dateStyle="medium" locale="it_IT" type="date" />
							</h:outputText></td>
				</c:forEach>
			</table>
		</h:form>

		<br>

		<a href='<c:url value="/faces/index.jsp" />'>Vai alla HomePage</a>

	</f:view>
</body>
</html>