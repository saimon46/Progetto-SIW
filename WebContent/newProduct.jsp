<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Nuovo prodotto</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			
			<h:form id="newProduct" styleClass="form-horizontal">
				<h:message for="createProduct" styleClass="error alert alert-danger" />
				<div>
					<h1>Inserimento nuovo prodotto</h1>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-4">Nome</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.name}" required="true"
							requiredMessage="Il nome e' obbligatorio!" id="name" />
						<h:message for="name" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="code" class="col-sm-1 control-label col-lg-offset-4">Codice</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.code}" required="true"
							requiredMessage="Il Codice e' obbligatorio!" id="code" />
						<h:message for="code" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="price" class="col-sm-1 control-label col-lg-offset-4">Prezzo</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{productController.price}" required="true"
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
							value="#{productController.quantity}" required="true"
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
							value="#{productController.description}" required="false"
							cols="20" rows="5" />
					</div>
				</div>
				<div class="form-group">
					<label for="addProviderList"
						class="col-sm-1 control-label col-lg-offset-4">Fornitore
						primario</label>
					<div class="col-sm-2">
						<h:selectOneMenu styleClass="form-control" id="addProviderList"
							value="#{productController.providerName}">
							<c:forEach var="provider"
								items="#{administratorController.providers}">
								<f:selectItem itemValue="#{provider.name}"
									itemLabel="#{provider.name}" />
							</c:forEach>
						</h:selectOneMenu>
						<h:message for="providerName" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton id="createProduct" styleClass="btn btn-success" value="Salva"
							action="#{productController.createProduct}" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>