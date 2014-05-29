<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Amministratore Loggato</title>
</head>
<body>
<f:view>
<h1>Benvenuto ${administratorController.administrator.nickname}</h1>
<h2>Login Eseguito!</h2>
<div>
<h:form>
	<h:commandButton value="Logout"  action="#{administratorController.logoutAdministrator}"/>
</h:form>
</div>
</f:view>
</body>
</html>