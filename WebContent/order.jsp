<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<title>Ordine n° ${currentOrder.id}</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<c:if test="${orderController.message != null && orderController.message != '' }">
				<span class="error alert alert-success">${orderController.message}</span>
				<br>
			</c:if>
			
			<h2>Ordine n° ${currentOrder.id}</h2>

			<div>
				Creato il:
				<h:outputText value="#{currentOrder.creationTime.time}">
					<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
						timeZone="Europe/Rome" />
				</h:outputText>
			</div>
			<div>
				Stato:
				<c:if test="${currentOrder.chiuso == false}">
					<span class="label label-danger">Aperto</span>
				</c:if>
				<c:choose>
					<c:when test="${currentOrder.evaso == true}">
						<span class="label label-success">Evaso</span>
					</c:when>
					<c:otherwise>
						<c:if test="${currentOrder.chiuso == true}">
							<span class="label label-warning">Completato</span>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${currentOrder.completedTime != null }">
				<div>
					Data Completamento:
					<h:outputText value="#{currentOrder.completedTime.time}">
						<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
							timeZone="Europe/Rome" />
					</h:outputText>
				</div>
			</c:if>
			<c:if test="${currentOrder.processedTime != null }">
				<div>
					Data Evasione:
					<h:outputText value="#{currentOrder.processedTime.time}">
						<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
							timeZone="Europe/Rome" />
					</h:outputText>
				</div>
			</c:if>
			<br>
			<c:if test="${currentOrder.chiuso == false}">
				<h4>Per aggiungere prodotti all'ordine vai al catalogo
					prodotti!</h4>
				<br>
				<h:form>
					<h:commandButton styleClass="btn btn-success"
						action="#{orderController.closeOrder}" value="Chiudi ordine" />
				</h:form>
			</c:if>

			<c:if test="${not empty currentOrder.orderLines}">
				<h3>Prodotti in ordine</h3>
				<h:form>
					<table class="table">
						<tr>
							<th>Codice</th>
							<th>Nome</th>
							<th>Prezzo</th>
							<th>Quantità</th>
						</tr>

						<c:forEach var="orderLine" items="#{currentOrder.orderLines}">
							<tr>
								<td><h:commandLink styleClass="btn btn-xs btn-link"
										action="#{productController.findProduct}"
										value="#{orderLine.product.code}">
										<f:param name="id" value="#{orderLine.product.id}" />
									</h:commandLink></td>
								<td>${orderLine.product.name}</td>
								<td>${orderLine.unitPrice}</td>
								<td>${orderLine.quantity}</td>
								<c:if test="${currentOrder.chiuso == false}">
									<td><h:commandButton styleClass="btn btn-xs btn-danger"
											action="#{orderController.deleteOrderLine}" value="Cancella">
											<f:param name="orderLineId" value="#{orderLine.id}" />
										</h:commandButton></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</h:form>
			</c:if>

			<c:if test="${currentOrder.chiuso == false}">
				<br>
				<br>
				<c:if test="${not empty currentOrder.orderLines}">
					<h:form styleClass="form-horizontal">
						<div>
							<h4>Modifica Quantita' Prodotti:</h4>
						</div>
						<div class="form-group">
							<label for="codeProduct"
								class="col-sm-1 control-label col-lg-offset-4">Codice
								Prodotto:</label>
							<div class="col-sm-2">
								<h:selectOneMenu styleClass="form-control"
									value="#{orderController.codeProductLineOrder}" required="true"
									id="codeProduct">
									<c:forEach var="orderLine" items="#{currentOrder.orderLines}">
										<f:selectItem itemValue="#{orderLine.product.code}"
											itemLabel="#{orderLine.product.code}" />
									</c:forEach>
								</h:selectOneMenu>
								<h:message for="codeProduct" />
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-1 control-label col-lg-offset-4">Nuova
								Quantita':</label>
							<div class="col-sm-2">
								<h:inputText styleClass="form-control"
									value="#{orderController.quantityNew}" required="true"
									requiredMessage="*" size="2" id="orderLineQuantity" />
								<h:message for="orderLineQuantity" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-5 col-sm-2">
								<h:commandButton styleClass="btn btn-primary"
									action="#{orderController.changeQuantityOrderLine}" value="OK">
								</h:commandButton>
							</div>
						</div>
					</h:form>
				</c:if>
			</c:if>
		</div>
	</f:view>
</body>
</html>