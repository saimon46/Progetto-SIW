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
<title>Login Utente</title>
</head>

<body>
	<f:view>
		<!-- Menù di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<div align="center">
			<h:form id="loginCustomer">
				<table class="table">
					<tr>
						<td>
							<div>
								<h2>Login utente</h2>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								E-mail:
								<h:inputText value="#{customerController.email}" required="true"
									requiredMessage="L'email e' obbligatoria!" id="email" />
								<h:message for="email" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								Password:
								<h:inputSecret value="#{customerController.password}"
									required="true" requiredMessage="La password e' obbligatoria!"
									id="password" />
								<h:message for="password" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<h:commandButton id="accedi" value="Accedi"
									action="#{customerController.loginCustomer}" />
								<h:message for="accedi" styleClass="error" />
							</div>
						</td>
					</tr>
				</table>
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

