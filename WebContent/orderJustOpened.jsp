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


<h3>Ordine Aperto correttamente!</h3>


<h2>Dettagli Preliminari</h2>
<div>ID Ordine: ${orderController.currentOrder.id}</div>
<div>Data Creazione: ${orderController.currentOrder.creationTime}</div>

<h4>Nella lista dei prodotti in negozio, clicca sui nomi dei prodotti desiderati per aggiungerli
		al tuo ordine</h4>
		
		<h:form>
		<h:commandButton action="#{productController.listProducts}"
			value="Lista dei Prodotti in Negozio" />
		</h:form>
		
</f:view>
</body>
</html>