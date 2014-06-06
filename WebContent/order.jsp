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
		<div>Data Creazione: ${currentOrder.creationTime}</div>
		<div>Data Completamento: ${currentOrder.completedTime}</div>
		<div>Data Spedizione: ${currentOrder.processedTime}</div>

		<br>
		<h3>${orderController.message}</h3>
		<br>
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

	</f:view>
</body>
</html>