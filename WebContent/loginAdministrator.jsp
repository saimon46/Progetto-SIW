<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Amministrazione</title>
</head>
<body>

<f:view>
<h1>Sezione Amministrazione</h1>
<h:form id="loginAdministrator">
<table border="2">
	<tr>
		<td><h2> Login ADMIN</h2></td>
	</tr>
	<tr>	
		<td>
			<div>Nickname: <h:inputText value="#{administratorController.nickname}" 
                     required="true"
                     requiredMessage="Il nickname e' obbligatorio!"
                     id="nickname"/> <h:message for="nickname" />
			</div>
		</td>
	</tr>
	<tr>	
		<td>
			<div>Password: <h:inputSecret value="#{administratorController.password}" 
                     required="true"
                     requiredMessage="La password e' obbligatoria!"
                     id="password"/> <h:message for="password" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div>
		<h:commandButton id="accediAdmin" value="Accedi"
			action="#{administratorController.loginAdministrator}"/>
			<h:message for="accediAdmin" styleClass="error"/>
			</div>
		</td>
	</tr>
</table>
</h:form>
</f:view>	
	
</body>
</html>

