<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login amministrazione</title>
</head>

<body>
	<f:view>
		<!-- Menu' di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<div align="center">
			<h:form id="loginAdministrator" styleClass="form-horizontal">
				<h:message for="accediAdmin" styleClass="error alert alert-danger" />
				<div>
					<h1>Sezione Amministrazione</h1>
				</div>
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
						<h:message for="nickname" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-4">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{administratorController.password}"
							required="true" requiredMessage="La password e' obbligatoria!"
							id="password" styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="accediAdmin"
							value="Accedi"
							action="#{administratorController.loginAdministrator}" />
					</div>
				</div>
			</h:form>
		</div>
		<div class="text-right col-md-6 col-md-offset-6">
			<h5><em>Per accedere e provare la sezione amministrazione:</em></h5>
			<h5><em>Nickname: admin1</em></h5>
			<h5><em>Password: admin1</em></h5>
		</div>
	</f:view>

</body>

<!-- include javascript, jQuery FIRST -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

</html>

