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
			<h1>Pagina di amministrazione</h1>
			
			<c:if test="${administratorController.message != null}">
				<span class="error alert alert-success">${administratorController.message }</span>
			</c:if>
		</div>
		
	</f:view>
</body>
</html>