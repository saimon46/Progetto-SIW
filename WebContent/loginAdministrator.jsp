<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<title>Login Amministrazione</title>
</head>

<body>
	<f:view>
		<!-- Menù di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<h1>Sezione Amministrazione</h1>
		<h:form id="loginAdministrator">
			<table class="table">
				<tr>
					<td><h2>Login ADMIN</h2></td>
				</tr>
				<tr>
					<td>
						<div>
							Nickname:
							<h:inputText value="#{administratorController.nickname}"
								required="true" requiredMessage="Il nickname e' obbligatorio!"
								id="nickname" />
							<h:message for="nickname" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							Password:
							<h:inputSecret value="#{administratorController.password}"
								required="true" requiredMessage="La password e' obbligatoria!"
								id="password" />
							<h:message for="password" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<h:commandButton id="accediAdmin" value="Accedi"
								action="#{administratorController.loginAdministrator}" />
							<h:message for="accediAdmin" styleClass="error" />
						</div>
					</td>
				</tr>
			</table>
		</h:form>
	</f:view>

</body>

<!-- include javascript, jQuery FIRST -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
</html>

