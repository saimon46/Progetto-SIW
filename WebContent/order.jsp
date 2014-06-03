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
<<<<<<< HEAD
<div>ID Ordine: ${orderController.order.id}</div>
<div>Data Creazione: ${orderController.order.creationTime}</div>
<div>Data Completamento: ${orderController.order.completedTime}</div>
<div>Data Spedizione: ${orderController.order.processedTime}</div>
<div>Evasione: ${orderController.order.evaso}</div>
=======
<div>ID Ordine: ${orderController.currentOrder.id}</div>
<div>Data Creazione: ${orderController.currentOrder.creationTime}</div>
<div>Data Completamento: ${orderController.currentOrder.completedTime}</div>
<div>Data Spedizione: ${orderController.currentOrder.processedTime}</div>
>>>>>>> 28cb14b6131778eeb4b5e2d0367555f05b9b6b68


<h2>Qui vanno stampate le righe ordine.....</h2>

<h:form>
	<h:commandButton action="#{productController.listProducts}"
		value="Lista dei Prodotti in Negozio" />
</h:form>
<<<<<<< HEAD
		
=======

>>>>>>> 28cb14b6131778eeb4b5e2d0367555f05b9b6b68
</f:view>
</body>
</html>