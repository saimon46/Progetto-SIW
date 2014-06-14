<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Nuovo fornitore</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h1>Inserimento fornitore</h1>
			<h:form id="addingProvider" styleClass="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-3">Nome</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.name}" required="true"
							requiredMessage="Campo obbligatorio" id="name" />
						<h:message for="name" style="color:red" />
					</div>
					<label for="email" class="col-sm-1 control-label">Email</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.email}" required="true"
							requiredMessage="Campo obbligatorio" id="email" />
						<h:message for="email" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="phoneNumber"
						class="col-sm-1 control-label col-lg-offset-3">Telefono</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.phoneNumber}" required="true"
							requiredMessage="Campo obbligatorio" id="phoneNumber" />
						<h:message for="phoneNumber" style="color:red" />
					</div>
					<label for="vatin" class="col-sm-1 control-label">Partita
						IVA</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.vatin}" required="true"
							requiredMessage="Campo obbligatorio" id="vatin" />
						<h:message for="vatin" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_street"
						class="col-sm-1 control-label col-lg-offset-3">Via/Piazza</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.street}" required="true"
							requiredMessage="Campo obbligatorio" id="address_street" />
						<h:message for="address_street" style="color:red" />
					</div>
					<label for="address_zipcode" class="col-sm-1 control-label">CAP</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.zipcode}" required="true"
							requiredMessage="Campo obbligatorio" id="address_zipcode" />
						<h:message for="address_zipcode" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_city"
						class="col-sm-1 control-label col-lg-offset-3">Citta'</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.city}" required="true"
							requiredMessage="Campo obbligatorio" id="address_city" />
						<h:message for="address_city" style="color:red" />
					</div>
					<label for="address_country" class="col-sm-1 control-label">Provincia</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.country}" required="true"
							requiredMessage="Campo obbligatorio" id="address_country" />
						<h:message for="address_country" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_state"
						class="col-sm-1 control-label col-lg-offset-3">Nazione</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{providerController.state}" required="true"
							requiredMessage="Campo obbligatorio" id="address_state" />
						<h:message for="address_state" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="addProvider"
							value="Salva" action="#{providerController.createProvider}" />
						<h:message for="addProvider" styleClass="error" style="color:red" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>