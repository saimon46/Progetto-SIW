<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Informazioni sul Fornitore</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h1>${providerController.provider.name}</h1>
<h2>Dettagli</h2>
<div>E-mail: ${providerController.provider.email}</div>
<div>Telefono: ${providerController.provider.phoneNumber}</div>
<div>Partita IVA: ${providerController.provider.vatin}</div>
<div>CAP: ${providerController.provider.address.zipcode}</div>
<div>Via/Piazza: ${providerController.provider.address.street}</div>
<div>Città: ${providerController.provider.address.city}</div>
<div>Provincia: ${providerController.provider.address.country}</div>
<div>Stato: ${providerController.provider.address.state}</div>

<div>
<br><br><a href='<c:url value="/faces/administratorPage.jsp" />'>Torna Indietro</a>
</div>

</f:view>
</body>
</html>