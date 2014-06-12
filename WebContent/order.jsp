<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Informazioni sull'Ordine</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<h2>Dettagli Completi</h2>
		<div>ID Ordine: ${currentOrder.id}</div>
		
		<div>Creato il: <h:outputText value="#{currentOrder.creationTime.time}">
		<f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome"/>
		</h:outputText></div>
		
		<div>
		<c:choose>
		<c:when test="${currentOrder.chiuso == false}">Stato: Aperto</c:when>
		<c:otherwise>
		Stato: Completato
		</c:otherwise>
		</c:choose>
		</div>
		
		<c:if test="${currentOrder.completedTime != null }">
		<div>Data Completamento: <h:outputText value="#{currentOrder.completedTime.time}">
		<f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
		</h:outputText></div>
		</c:if>
		
		<div>
		<c:choose>
		<c:when test="${currentOrder.evaso == false}">Evaso: NO</c:when>
		<c:otherwise>
		Evaso: SI
		</c:otherwise>
		</c:choose>
		</div>
		
		<c:if test="${currentOrder.processedTime != null }">
		<div>Data Spedizione: <h:outputText value="#{currentOrder.processedTime.time}">
		<f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
		</h:outputText></div>
		</c:if>

		<br>
		<h3>${orderController.message}</h3>
		
		<c:if test="${not empty currentOrder.orderLines}">
			<h4>Righe ordine:</h4>
			<h:form>
			<table>
				<tr>
					<th>Codice</th>
					<th>Nome</th>
					<th>Prezzo</th>
					<th>Quantità</th>
				</tr>

				<c:forEach var="orderLine" items="#{currentOrder.orderLines}">
					<tr>
						<td><h:commandLink action="#{productController.findProduct}"
								value="#{orderLine.product.code}">
								<f:param name="id" value="#{orderLine.product.id}" />
							</h:commandLink></td>
						<td>${orderLine.product.name}</td>
						<td>${orderLine.unitPrice}</td>
						<td>${orderLine.quantity}</td>
					</tr>
				</c:forEach>
			</table>
			</h:form>
		</c:if>

		<h:form>
			<h:commandButton action="#{productController.listProducts}"
				value="Lista dei Prodotti in Negozio" />
		</h:form>
		
		<c:if test="${currentOrder.chiuso == false}">
			<h:form>
				<h:commandButton action="#{orderController.closeOrder}"
					value="Chiudi ordine" />
			</h:form>
		</c:if>
	</f:view>
</body>
</html>