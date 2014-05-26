<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SIW-JEE-ES2</title>
</head>
<body>
	<f:view>
		<h1>SIW-JEE-ES2</h1>
		<ul>
			<li><a href='<c:url value="/faces/newProduct.jsp" />'>Insert
					a new product</a></li>
			<li><h:form>
					<h:commandLink action="#{productController.listProducts}"
						value="List all Products" />
				</h:form></li>
		</ul>
	</f:view>
</body>
</html>

