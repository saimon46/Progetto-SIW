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
<h1>Ciao ${customerController.customer.firstName} ${customerController.customer.lastName}</h1>
<h2>Queste sono le informazioni associate al tuo account:</h2>
<div>Via/Piazza: ${customerController.customer.address.street}</div>
<div>Città: ${customerController.customer.address.city}</div>
<div>Provincia: ${customerController.customer.address.country}</div>
<div>Stato: ${customerController.customer.address.state}</div>
<div>CAP: ${customerController.customer.address.zipcode}</div>
<div>Numero di Telefono: ${customerController.customer.phoneNumber}</div>
<div>Data di Nascita: ${customerController.customer.dateOfBirth}</div>
<div>Data di Registrazione: ${customerController.customer.registrationDate}</div>
<div>
<br><br><a href='<c:url value="/faces/customerPage.jsp" />'>Torna Indietro</a>
</div>
</f:view>
</body>
</html>