<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Info Customer</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<h1>Ciao ${customerController.currentCustomer.firstName}
			${customerController.currentCustomer.lastName}</h1>
		<h2>Queste sono le informazioni associate al tuo account:</h2>
		<div>Via/Piazza:
			${customerController.currentCustomer.address.street}</div>
		<div>Città: ${customerController.currentCustomer.address.city}</div>
		<div>Provincia:
			${customerController.currentCustomer.address.country}</div>
		<div>Stato: ${customerController.currentCustomer.address.state}</div>
		<div>CAP: ${customerController.currentCustomer.address.zipcode}</div>
		<div>Numero di Telefono:
			${customerController.currentCustomer.phoneNumber}</div>
		<div>
			Data di Nascita:
			<h:outputText
				value="#{customerController.currentCustomer.dateOfBirth}">
				<f:convertDateTime dateStyle="medium" locale="it_IT" type="date" />
			</h:outputText>
		</div>
		<div>
			Data di Registrazione:
			<h:outputText
				value="#{customerController.currentCustomer.registrationDate.time}">
				<f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
			</h:outputText>
		</div>
	</f:view>
</body>
</html>