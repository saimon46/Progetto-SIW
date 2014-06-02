<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Informazioni sull'Ordine</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h2>Dettagli</h2>
<h1>ID: ${orderController.order.id}</h1>
<div>Ordine Chiuso?: ${orderController.order.chiuso}</div>
<div>Data Creazione: ${orderController.order.creationTime}</div>
<div>Data Completamento: ${orderController.order.completedTime}</div>
<div>Data Spedizione: ${orderController.order.processedTime}</div>

<h2>Qui vanno stampate le righe ordine.....</h2>
</f:view>
</body>
</html>