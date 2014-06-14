<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Modifica prodotto</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h1>Modifica prodotto</h1>
			<h:form styleClass="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-4">Nome</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.product.name}" required="true"
							requiredMessage="Il nome e' obbligatorio!" id="name" />
						<h:message for="name" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="code" class="col-sm-1 control-label col-lg-offset-4">Codice</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.product.code}" required="true"
							requiredMessage="Il Codice e' obbligatorio!" id="code" />
						<h:message for="code" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="price" class="col-sm-1 control-label col-lg-offset-4">Prezzo</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.product.price}" required="true"
							requiredMessage="Il prezzo e' obbligatorio!"
							converterMessage="Il prezzo deve essere un numero!" id="price" />
						<h:message for="price" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="quantity"
						class="col-sm-1 control-label col-lg-offset-4">Quantita'</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.product.quantity}" required="true"
							requiredMessage="La quantita' e' obbligatoria!"
							converterMessage="La quantita' deve essere un numero!"
							id="quantity" />
						<h:message for="quantity" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="description"
						class="col-sm-1 control-label col-lg-offset-4">Descrizione</label>
					<div class="col-sm-2">
						<h:inputTextarea id="description" styleClass="form-control"
							value="#{productController.product.description}" required="false"
							cols="20" rows="5" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton value="Salva Modifiche"
							styleClass="btn btn-primary"
							action="#{productController.updateProduct}" />
					</div>
				</div>
			</h:form>

			<c:if test="${not empty currentProduct.providers}">
				<hr>
				<div class="form-group">
					<h:form id="removeProviderMenu">
						<div class="form-group">
							<label for="listProvider"
								class="col-sm-1 control-label col-lg-offset-4">Fornitore/i</label>
							<div class="col-sm-2">
								<h:selectOneMenu styleClass="form-control" id="listProvider"
									value="#{productController.providerNameDelete}" required="true"
									requiredMessage="Seleziona elemento!">
									<c:forEach var="provider" items="#{currentProduct.providers}">
										<f:selectItem itemValue="#{provider.name}"
											itemLabel="#{provider.name}" />
									</c:forEach>
								</h:selectOneMenu>
							</div>
							<div class="col-sm-2">
								<h:commandButton styleClass="btn btn-warning"
									id="removeProvider" value="Rimuovi fornitore e salva"
									action="#{productController.removeProvider}" />
							</div>
						</div>
					</h:form>
				</div>
			</c:if>
			<br> <br>
			<hr>
			<c:if test="${not empty providersProduct}">
				<div class="form-group">
					<h:form id="addProviderMenu">
						<div class="form-group">
							<label for="addProviderList"
								class="col-sm-1 control-label col-lg-offset-4">Aggiungi
								un altro fornitore</label>
							<div class="col-sm-2">
								<h:selectOneMenu styleClass="form-control" id="addProviderList"
									value="#{productController.providerName}">
									<c:forEach var="provider" items="#{providersProduct}">
										<f:selectItem itemValue="#{provider.name}"
											itemLabel="#{provider.name}" />
									</c:forEach>
								</h:selectOneMenu>
							</div>
							<div class="col-sm-2">
								<h:commandButton styleClass="btn btn-success"
									id="removeProvider" value="Aggiungi fornitore e salva"
									action="#{productController.addProvider}" />
							</div>
						</div>
					</h:form>
				</div>
			</c:if>
		</div>
	</f:view>
</body>
</html>