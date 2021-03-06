<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Catalogo prodotti</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h1>Catalogo Prodotti</h1>
			<h:form>
				<table class="table">
					<tr>
						<th>Nome</th>
						<th>Prezzo</th>
						<th>Quantita'</th>
					</tr>
					<c:forEach var="product" items="#{productController.products}">
						<tr>
							<td><h:commandLink action="#{productController.findProduct}"
									value="#{product.name}">
									<f:param name="id" value="#{product.id}" />
								</h:commandLink></td>
							<td><h:outputText id="price" value="#{product.price}">
									<f:convertNumber currencyCode="EUR" groupingUsed="true"
										maxFractionDigits="2" type="currency" />
								</h:outputText></td>
							<td>${product.quantity}</td>
						</tr>
					</c:forEach>
				</table>
			</h:form>
		</div>
	</f:view>
</body>
</html>