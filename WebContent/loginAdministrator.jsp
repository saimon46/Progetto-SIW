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
		<div align="center">
			<h1>Sezione Amministrazione</h1>
			<h:form id="loginAdministrator" styleClass="form-horizontal">
				<div>
					<h2>Login Amministratore</h2>
				</div>
				<div class="form-group">
					<label for="nickname"
						class="col-sm-1 control-label col-lg-offset-4">Nickname</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.nickname}"
							required="true" requiredMessage="Il nickname e' obbligatorio!"
							id="nickname" styleClass="form-control" />
						<h:message for="nickname" />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-4">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{administratorController.password}"
							required="true" requiredMessage="La password e' obbligatoria!"
							id="password" styleClass="form-control" />
						<h:message for="password" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="accediAdmin"
							value="Accedi"
							action="#{administratorController.loginAdministrator}" />
						<h:message for="accediAdmin" styleClass="error" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>

</body>

<!-- include javascript, jQuery FIRST -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

</html>

