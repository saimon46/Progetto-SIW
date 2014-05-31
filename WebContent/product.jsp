<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Informazioni sul Prodotto</title>
</head>
<body>
<f:view>
<h1>${productController.product.name}</h1>
<h2>Dettagli</h2>
<div>Codice: ${productController.product.code}</div>
<div>Prezzo: ${productController.product.price}</div>
<div>Quantità: ${productController.product.quantity}</div>
<div>Descrizione: ${productController.product.description}</div>

<br><br><br>
<a href='<c:url value="/faces/products.jsp" />'>Vai alla Lista dei Prodotti</a>
		
</f:view>
</body>
</html>