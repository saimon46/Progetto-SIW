<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registrazione Effettuata!</title>
</head>
<body>
	<h2>Registrazione avvenuta con successo!</h2>
	<h4>... reindirizzamento alla tua pagina in corso ...</h4>
	
	<!--  Aggiungere qui un Timestop -->
	<c:choose>
		<c:when test="${administratorController.administrator != null}">
			<meta http-equiv="refresh" content="0; url=faces/administratorPage.jsp" />
		</c:when>
		<c:otherwise>
			<meta http-equiv="refresh" content="0; url=faces/customerPage.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>