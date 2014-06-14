<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Pagina cliente</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h2>Info cliente</h2>
			<address>
				<strong>${customerController.currentCustomer.firstName}
					${customerController.currentCustomer.lastName}</strong><br>
				${customerController.currentCustomer.address.street}<br>
				${customerController.currentCustomer.address.zipcode}
				${customerController.currentCustomer.address.city},
				(${customerController.currentCustomer.address.country})<br>
				${customerController.currentCustomer.address.state}<br> <abbr
					title="Telefono">Tel:</abbr>
				${customerController.currentCustomer.phoneNumber}
			</address>
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
					<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
						timeZone="Europe/Rome" />
				</h:outputText>
			</div>
			<h3><strong><em>Scegli un'operazione sulla barra superiore per iniziare!</em></strong></h3>
		</div>
	</f:view>
</body>
</html>