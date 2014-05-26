<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Product</title>
</head>
<body>
<f:view>
<h1>${productController.product.name}</h1>
<h2>Details</h2>
<div>Code: ${productController.product.code}</div>
<div>Price: ${productController.product.price}</div>
<div>Description: ${productController.product.description}</div>
</f:view>
</body>
</html>