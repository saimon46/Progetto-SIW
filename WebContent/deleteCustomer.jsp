<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Cancella Utente</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h3>Elimina un utente:</h3>
<h5>Inseriscine l'e-mail (Attenzione: Verranno eliminati tutti i suoi ordini associati -operazione irreversibile-)</h5>
<h:form id="deletingCustomer">
    <div>E-mail Utente: <h:inputText value="#{administratorController.email}" 
                     required="true"
                     requiredMessage="L'email è obbligatoria per eseguire l'operazione!"
                     id="email"/> <h:message for="email" />
	</div>
	<div>
		<h:commandButton id="deleteCustomer" value="Elimina Utente"  
			action="#{administratorController.deleteCustomer}"/>
		<h:message for="deleteCustomer" styleClass="error"/>
	</div>
</h:form>
<br><br>
<a href='<c:url value="/faces/administratorPage.jsp" />'>Torna all'amministrazione</a>
</f:view>
</body>
</html>