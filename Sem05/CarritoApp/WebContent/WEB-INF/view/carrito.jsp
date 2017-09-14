<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EL CARRITO</title>
</head>
<body>

	<!-- Parte comun para todas las páginas -->
	<div>
		<jsp:include page="titulo.jsp"/>
	</div>
	<div>
		<jsp:include page="menu.jsp"/>
	</div>
	
	<!-- El Carrito -->
	
	<h2>CARRITO</h2>

	<table>
	
		<tr>
			<th>ID</th>
			<th>PRODUCTO</th>
			<th>PRECIO</th>
			<th>CANT</th>
			<th>SUBTOTAL</th>
			<th>ACCION</th>
		</tr>
	
		<c:forEach items="${sessionScope.carrito.lista}" var="r">
		<tr>
			<td>${r.id}</td>
			<td>${r.producto}</td>
			<td>${r.precio}</td>
			<td>${r.cant}</td>
			<td>${r.importe}</td>
			<td><a href="#">Eliminar</a></td>
		</tr>
		</c:forEach>
	</table>
	
	<!-- Totales -->
	<br/>
	<table>
		
		<tr>
			<td>Importe</td>
			<td>${sessionScope.carrito.importe}</td>
		</tr>
		<tr>
			<td>Impuesto</td>
			<td>${sessionScope.carrito.impuesto}</td>
		</tr>
		<tr>
			<td>Total</td>
			<td>${sessionScope.carrito.total}</td>
		</tr>
	
	</table>




</body>
</html>