<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
</head>

<h:form>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/faces/index.jsp">Home</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><h:commandLink action="#{productController.listProducts}"
							value="Catalogo prodotti" /></li>
				</ul>

				<!-- Login amministrazione -->
				<ul class="nav navbar-nav navbar-right">
					<c:if
						test="${administratorController.currentAdministrator == null && customerController.currentCustomer == null}">
						<li><a
							href='<c:url value="/faces/customerRegistration.jsp" />'>Registrati</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Amministrazione<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a
									href='<c:url value="/faces/loginAdministrator.jsp" />'>Login
										amministratore</a></li>
							</ul></li>
					</c:if>
				</ul>

			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
</h:form>

<!-- include javascript, jQuery FIRST -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>