<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<c:if test="${administratorController.administrator != null}">
<p>
	<div align=right>
	<h3><a href='<c:url value="/faces/administratorPage.jsp" />'>
	<c:out value="Amministratore loggato: ${administratorController.administrator.nickname}  "/>
	</a></h3>
	</div>
	<h:form>
		<h:commandButton style="float:right" value="Logout"  action="#{administratorController.logoutAdministrator}"/>
	</h:form>
<p>
</c:if>
<c:if test="${customerController.customer != null}">
<p>
	<div align=right>
	<h3><a href='<c:url value="/faces/customerPage.jsp" />'>
		<c:out value="Log-In Effettuato come: ${customerController.customer.firstName} ${customerController.customer.lastName}  "/>
	</a></h3>
	</div>
	<h:form>
		<h:commandButton style="float:right" value="Logout"  action="#{customerController.logoutCustomer}"/>
	</h:form>
<p>
</c:if>