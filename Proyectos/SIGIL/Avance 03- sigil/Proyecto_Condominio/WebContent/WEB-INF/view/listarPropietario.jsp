<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<title>Listar Propietario</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/Miestilo.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/bootstrap.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/font-awesome.css"/>'>
<script type="text/javascript" src='<c:url value="/js/jquery.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.js"/>'></script>
<style type="text/css">
body
{
	background-color:#ffd9aa;
}
.btnMicuenta
{
	margin-left: 30px;
}

#tb_C_timn tr td
{
padding: 5px;
}
</style>
</head>
<body>
<div class="container">
	<div>
	<jsp:include page="cabezera.jsp"></jsp:include>
	</div>
	
	<div id="cotenido" class="container">
		<h2>Listar a todas las personas</h2>
		
		<form name="" action="listarPropietario.htm" method="post">
		<input type="submit" value="Consultar" >
		
		<table id="tb_C_timn" class="table table-striped" border>
				
			<tr>
				<td>Codigo</td>
				<td>Tipo de Persona</td>
				<td>Nombres</td>
				<td>dni</td>
				<td>email</td>
				<td>telefono</td>
				<td>direccion</td>
			</tr>
			
			<c:forEach items="${propietario}" var="dato">
				<tr>
					<td>${dato.idpersona}</td>
					<td>${dato.idtpersona}</td>
					<td>${dato.apellido}</td>
					<td>${dato.nombre}</td>
					<td>${dato.dni}</td>
					<td>${dato.email}</td>
					<td>${dato.telefono}</td>
					<td>${dato.direccion}</td>
				</tr>
			</c:forEach>
			
		</table>
	
		</form>
	
	</div>
	<br>
	<br>
	<div id="pie_pagina">
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
</div>
</body>
</html>