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

<h2>Dettagli Completi</h2>
<div>ID Ordine: ${orderController.currentOrder.id}</div>
<div>Data Creazione: ${orderController.currentOrder.creationTime}</div>
<div>Data Completamento: ${orderController.currentOrder.completedTime}</div>
<div>Data Spedizione: ${orderController.currentOrder.processedTime}</div>


<h2>Qui vanno stampate le righe ordine.....</h2>

<h:form>
	<h:commandButton action="#{productController.listProducts}"
		value="Lista dei Prodotti in Negozio" />
</h:form>

</f:view>
</body>
</html>