<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login cliente</title>
</head>

<body>
	<f:view>
		<!-- Menu' di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<div align="center">
			<h:form id="loginCustomer" styleClass="form-horizontal">
				<h:message for="accedi" styleClass="error alert alert-danger" />
				<div>
					<h2>Login utente</h2>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-4">Email</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.email}" required="true"
							requiredMessage="L'email e' obbligatoria!" id="email"
							styleClass="form-control" />
						<h:message for="email" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-1 control-label col-lg-offset-4">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{customerController.password}"
							required="true" requiredMessage="La password e' obbligatoria!"
							id="password" styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="accedi"
							value="Accedi" action="#{customerController.loginCustomer}" />
					</div>
				</div>
				<div>
					<h4>
						oppure <a href='<c:url value="/faces/customerRegistration.jsp" />'>Registrati</a>
					</h4>
				</div>
			</h:form>
		</div>
	</f:view>
</body>

</html>

