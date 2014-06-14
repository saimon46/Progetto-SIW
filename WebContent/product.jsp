<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Prodotto n° ${productController.product.code}</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h2>${productController.product.name}</h2>
			<h3>Dettagli</h3>
			<div>Codice: ${productController.product.code}</div>
			<div>Prezzo: ${productController.product.price}</div>
			<div>Quantità: ${productController.product.quantity}</div>
			<div>Descrizione: ${productController.product.description}</div>

			<c:if test="${not empty productController.product.providers}">
				<div class="form-group">
					<label for="listProvider"
						class="col-sm-1 control-label col-lg-offset-4">Fornitore/i</label>
					<div class="col-sm-2">
						<h:selectOneMenu styleClass="form-control" id="listProvider">
							<c:forEach var="provider"
								items="#{productController.product.providers}">
								<f:selectItem itemLabel="#{provider.name}" />
							</c:forEach>
						</h:selectOneMenu>
					</div>
				</div>
				<br>
				<br>
				<hr>
			</c:if>
			
			<!-- Sono un cliente (posso vedere ciò quando c'è un ordine corrente "aperto"!)-->
			<c:if test="${currentOrder != null && currentOrder.chiuso == false}">
				<h:form styleClass="form-horizontal">
					<div>
						<h4>Aggiungi prodotto all'ordine corrente
							n°${currentOrder.id}</h4>
					</div>
					<div class="form-group">
						<label for="quantity"
							class="col-sm-1 control-label col-lg-offset-4">Quantita'
							desiderata </label>
						<div class="col-sm-2">
							<h:inputText styleClass="form-control"
								value="#{orderController.quantity}" required="true"
								requiredMessage="La quantita' e' obbligatoria!"
								validatorMessage="La quantita' non puo' esser negativa!"
								converterMessage="La quantita' deve essere un numero!"
								id="quantity">
								<f:validateLongRange minimum="1" />
							</h:inputText>
							<h:message for="quantity" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-2">
							<h:commandButton styleClass="btn btn-primary"
								action="#{orderController.addOrderLine}"
								value="Aggiungi all'ordine corrente" />
						</div>
					</div>
				</h:form>
			</c:if>
			
			<!-- Sono un amministratore -->
			<c:if test="${administratorController.currentAdministrator != null}">
				<h:form styleClass="form-horizontal">
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-2">
							<h:commandButton styleClass="btn btn-warning"
								action="#{administratorController.modifyProduct}"
								value="Modifica" />
						</div>
						<div class="col-sm-2">
							<h:commandButton styleClass="btn btn-danger"
								action="#{productController.deleteProduct}" value="Elimina" />
						</div>
					</div>
				</h:form>
			</c:if>
		</div>
	</f:view>
</body>
</html>