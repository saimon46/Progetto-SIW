<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Nuovo cliente</title>
</head>
<body>
	<f:view>
		<!-- Menù di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<div align="center">
			<h:form id="registrationCustomerByAdmin" styleClass="form-horizontal">
				<h:message for="signinCustomerByAdmin" styleClass="error alert alert-danger" />
				<div>
					<h2>Registrazione utente</h2>
				</div>
				<div class="form-group">
					<label for="firstName"
						class="col-sm-1 control-label col-lg-offset-3">Nome</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.firstName}"
							required="true" requiredMessage="Campo Obbligatorio" id="firstName"
							styleClass="form-control" />
						<h:message for="firstName" style="color:red" />
					</div>
					<label for="lastName" class="col-sm-1 control-label">Cognome</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.lastName}"
							required="true" requiredMessage="Campo Obbligatorio" id="lastName"
							styleClass="form-control" />
						<h:message for="lastName" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-3">E-mail</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.email}" required="true"
							requiredMessage="Campo Obbligatorio" id="email" styleClass="form-control" />
						<h:message for="email" style="color:red" />
					</div>
					<label for="password" class="col-sm-1 control-label">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{administratorController.password}"
							required="true" requiredMessage="Campo Obbligatorio" id="password"
							styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="dateOfBirth"
						class="col-sm-1 control-label col-lg-offset-3">Data di
						Nascita</label>
					<div class="col-sm-2">
						<t:inputDate value="#{administratorController.dateOfBirth}"
							required="true" requiredMessage="Campo Obbligatorio" id="dateOfBirth"
							styleClass="form-control" />
						<h:message for="dateOfBirth" style="color:red" />
					</div>
					<label for="phoneNumber" class="col-sm-1 control-label">Telefono</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.phoneNumber}"
							required="true" requiredMessage="Campo Obbligatorio" id="phoneNumber"
							styleClass="form-control" />
						<h:message for="phoneNumber" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="street" class="col-sm-1 control-label col-lg-offset-3">Via/Piazza</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.street}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_street" styleClass="form-control" />
						<h:message for="address_street" style="color:red" />
					</div>
					<label for="zipcode" class="col-sm-1 control-label">CAP</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.zipcode}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_zipcode"
							styleClass="form-control" />
						<h:message for="address_zipcode" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_city"
						class="col-sm-1 control-label col-lg-offset-3">Citta'</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.city}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_city" styleClass="form-control" />
						<h:message for="address_city" style="color:red" />
					</div>
					<label for="address_country" class="col-sm-1 control-label">Provincia</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.country}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_country"
							styleClass="form-control" />
						<h:message for="address_country" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_state"
						class="col-sm-1 control-label col-lg-offset-3">Nazione</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.state}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_state" styleClass="form-control" />
						<h:message for="address_state" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-3">
						<h:commandButton styleClass="btn btn-primary" id="signinCustomerByAdmin"
							value="Registrati" action="#{administratorController.createCustomer}" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>