<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Catalogo prodotti</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h1>Ordini effettuati</h1>
			<h:form>
				<table class="table">
					<tr>
						<th>Codice</th>
						<th>Data creazione</th>
						<th>Stato</th>
						<th>Data completamento</th>
						<th>Data evasione</th>
					</tr>
					<c:forEach var="order" items="#{customerController.orders}">
						<tr>
							<td><h:commandLink action="#{orderController.findOrder}"
									value="#{order.id}">
									<f:param name="id" value="#{order.id}" />
								</h:commandLink></td>

							<td><h:outputText value="#{order.creationTime.time}">
									<f:convertDateTime dateStyle="medium" locale="it_IT"
										type="both" timeZone="Europe/Rome" />
								</h:outputText></td>

							<td><c:if test="${order.chiuso == false}">
									<span class="label label-danger">Aperto</span>
								</c:if> <c:choose>
									<c:when test="${order.evaso == true}">
										<span class="label label-success">Evaso</span>
									</c:when>
									<c:otherwise>
										<c:if test="${order.chiuso == true}">
											<span class="label label-warning">Completato</span>
										</c:if>
									</c:otherwise>
								</c:choose></td>

							<td><h:outputText value="#{order.completedTime.time}">
									<f:convertDateTime dateStyle="medium" locale="it_IT"
										type="both" timeZone="Europe/Rome" />
								</h:outputText></td>

							<td><h:outputText value="#{order.processedTime.time}">
									<f:convertDateTime dateStyle="medium" locale="it_IT"
										type="both" timeZone="Europe/Rome" />
								</h:outputText></td>
					</c:forEach>
				</table>
			</h:form>
		</div>
	</f:view>
</body>
</html>