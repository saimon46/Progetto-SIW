<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Utente Loggato</title>
</head>
<body>
<f:view>
<h:message for="registrationCustomer" styleClass="error"/>
<h4>Log-In Effettuato come: ${customerController.customer.firstName} ${customerController.customer.lastName}</h4>
<h3>Utente: Funzionalità</h3>

<h4>.....Da implementare.....</h4>

<div>
<h:form>
	<h:commandButton value="Logout"  action="#{customerController.logoutCustomer}"/>
</h:form>
</div>
</f:view>
</body>
</html>