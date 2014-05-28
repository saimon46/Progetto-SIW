<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Utente Loggato</title>
</head>
<body>
<f:view>
<h1>Benvenuto ${customerController.customer.firstName}</h1>
<h2>Queste sono le info associate al tuo account:</h2>
<div>Cognome: ${customerController.customer.lastName}</div>
<div>Indirizzo: ${customerController.customer.address}</div>
<div>Numero di Telefono: ${customerController.customer.phoneNumber}</div>
<div>Data di Nascita: ${customerController.customer.dateOfBirth}</div>
<div>Data di Registrazione: ${customerController.customer.registrationDate}</div>
</f:view>
</body>
</html>