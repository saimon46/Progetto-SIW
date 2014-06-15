<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Amministrazione</title>
</head>
<body>
	<f:view>

		<jsp:include page="header.jsp" />
		
		<div align="center">
			<c:if test="${administratorController.message != null && administratorController.message != ''}">
				<span class="error alert alert-success">${administratorController.message }</span>
				<br>
			</c:if>
			<h1>Pagina di amministrazione</h1>
			<h3><strong><em>Scegli un'operazione sulla barra superiore per iniziare!</em></strong></h3>
		</div>
	</f:view>
</body>
</html>