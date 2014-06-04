<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Modifica Prodotto</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h:form>
    <div>Nome: <h:inputText value="#{productController.product.name}" 
                     required="true"
                     requiredMessage="Il nome e' obbligatorio!"
                     id="name"/> <h:message for="name" />
	</div>
    <div>Codice: <h:inputText value="#{productController.product.code}" 
                     required="true"
                     requiredMessage="Il Codice e' obbligatorio!"
                     id="code"/> <h:message for="code" />
	</div>
    <div>Prezzo: <h:inputText value="#{productController.product.price}" 
                     required="true"
                     requiredMessage="Il prezzo e' obbligatorio!"
                     converterMessage="Il prezzo deve essere un numero!"
                     id="price"/> <h:message for="price" />
	</div>
	<div>Quantita': <h:inputText value="#{productController.product.quantity}" 
                     required="true"
                     requiredMessage="La quantita' e' obbligatoria!"
                     converterMessage="La quantita' deve essere un numero!"
                     id="quantity"/> <h:message for="quantity" />
	</div>
    <div>Descrizione: <h:inputTextarea value="#{productController.product.description}" 
    				required="false" 
    				cols="20" 
    				rows="5" /> 
	</div>
	<table>
	<tr><td>Fornitore/i:<td>
	<c:forEach var="provider" items="#{currentProduct.providers}">
		<td>${provider.name}</td>
	</c:forEach>
	</tr>
	</table>
	<div>Aggiungi fornitore:
	<h:form id="addProviderMenu">
         <h:selectOneMenu value="#{productController.productName}">
         	<c:forEach var="provider" items="#{administratorController.providers}">
				<f:selectItem itemValue="#{provider.name}" itemLabel="#{provider.name}" />
			</c:forEach>
         </h:selectOneMenu>
          	<h:commandButton id="addProvider" value="Aggiungi provider"  action="#{productController.addProvider}"/>
          	<h:message for="addProvider" />
    </h:form>
	</div>
	
	<div>
		<h:commandButton value="Salva"  action="#{productController.updateProduct}"/>
	</div>
</h:form>
</f:view>
</body>
</html>