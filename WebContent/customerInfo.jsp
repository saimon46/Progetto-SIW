<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Info Customer</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h1>Ciao ${customerController.currentCustomer.firstName} ${customerController.customer.lastName}</h1>
<h2>Queste sono le informazioni associate al tuo account:</h2>
<div>Via/Piazza: ${customerController.currentCustomer.address.street}</div>
<div>Città: ${customerController.currentCustomer.address.city}</div>
<div>Provincia: ${customerController.currentCustomer.address.country}</div>
<div>Stato: ${customerController.currentCustomer.address.state}</div>
<div>CAP: ${customerController.currentCustomer.address.zipcode}</div>
<div>Numero di Telefono: ${customerController.currentCustomer.phoneNumber}</div>
<div>Data di Nascita: ${customerController.currentCustomer.dateOfBirth}</div>
<div>Data di Registrazione: ${customerController.currentCustomer.registrationDate}</div>
<div>
<br><br><a href='<c:url value="/faces/customerPage.jsp" />'>Torna Indietro</a>
</div>
</f:view>
</body>
</html>