<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Inserimento Nuovo Prodotto</title>
</head>
<body>
<f:view>
<jsp:include page="header.jsp"/>
<h:form>
    <div>Nome: <h:inputText value="#{productController.name}" 
                     required="true"
                     requiredMessage="Il nome e' obbligatorio!"
                     id="name"/> <h:message for="name" />
	</div>
    <div>Codice: <h:inputText value="#{productController.code}" 
                     required="true"
                     requiredMessage="Il Codice e' obbligatorio!"
                     id="code"/> <h:message for="code" />
	</div>
    <div>Prezzo: <h:inputText value="#{productController.price}" 
                     required="true"
                     requiredMessage="Il prezzo e' obbligatorio!"
                     converterMessage="Il prezzo deve essere un numero!"
                     id="price"/> <h:message for="price" />
	</div>
	<div>Quantita': <h:inputText value="#{productController.quantity}" 
                     required="true"
                     requiredMessage="La quantita' e' obbligatoria!"
                     converterMessage="La quantita' deve essere un numero!"
                     id="quantity"/> <h:message for="quantity" />
	</div>
    <div>Descrizione: <h:inputTextarea value="#{productController.description}" 
    				required="false" 
    				cols="20" 
    				rows="5" /> 
	</div>
	<div>Fornitore:
         <h:selectOneMenu value="#{productController.productName}">
         	<c:forEach var="provider" items="#{administratorController.providers}">
				<f:selectItem itemValue="#{provider.name}" itemLabel="#{provider.name}" />
			</c:forEach>
         </h:selectOneMenu>
	</div>
	
	<div>
		<h:commandButton value="Salva"  action="#{productController.createProduct}"/>
	</div>
</h:form>
</f:view>
</body>
</html>