<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Informazioni sul Prodotto</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<h1>${productController.product.name}</h1>
		<h2>Dettagli</h2>
		<div>Codice: ${productController.product.code}</div>
		<div>Prezzo: ${productController.product.price}</div>
		<div>Quantità: ${productController.product.quantity}</div>
		<div>Descrizione: ${productController.product.description}</div>

		<c:if test="${not empty productController.product.providers}">
			<div>
				Fornitore/i attuali:
				<h:selectOneListbox id="listProvider">
					<c:forEach var="provider"
						items="#{productController.product.providers}">
						<f:selectItem itemLabel="#{provider.name}" />
					</c:forEach>
				</h:selectOneListbox>
			</div>
		</c:if>
		
		<br>
		<!-- Sono un cliente (posso vedere ciò quando c'è un ordine corrente "aperto"!)-->
		<c:if test="${currentOrder != null && currentOrder.chiuso == false}">
			<p>
				<h:form>
					<div>
						Quantita' desiderata:
						<h:inputText value="#{orderController.quantity}" required="true"
							requiredMessage="La quantita' e' obbligatoria!"
							converterMessage="La quantita' deve essere un numero!"
							id="quantity" />
						<h:message for="quantity" />
					</div>
					<h:commandButton action="#{orderController.addOrderLine}"
						value="Aggiungi all'ordine corrente" />
				</h:form>
			<p>
		</c:if>
		
		<!-- Sono un amministratore -->
		<c:if test="${administratorController.currentAdministrator != null}">
			<p>
				<h:form>
					<h:commandButton action="#{administratorController.modifyProduct}"
						value="Modifica" />
				</h:form>
				<br>
				<h:form>
					<h:commandButton action="#{productController.deleteProduct}"
						value="Elimina" />
				</h:form>
			<p>
		</c:if>

		<br>
		<br>
		<br>
		<h:form>
			<h:commandButton action="#{productController.listProducts}"
				value="Ritorna al catalogo dei Prodotti" />
		</h:form>

	</f:view>
</body>
</html>