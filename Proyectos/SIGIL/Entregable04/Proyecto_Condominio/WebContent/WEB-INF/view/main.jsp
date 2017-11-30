<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<title>Primer avanze</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/Miestilo.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/bootstrap.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/font-awesome.css"/>'>
<script type="text/javascript" src='<c:url value="/js/jquery.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/main.js"/>'></script>
<style type="text/css">
body
{
	background-color:#ffd9aa;
}
</style>
</head>
<body>
<div class="container">
	<div>
	 <c:set var = "cod"  value = "${usuario.idrol}"/>
	<c:choose> 
	  <c:when test="${cod == 1}">
	    Value is 5
	  </c:when>
	   <c:when test="${cod == 2}">
	   <jsp:include page="cabezera.jsp"></jsp:include>
	  </c:when>
	</c:choose>
	</div>
	<div id="cotenido" class="container">
	<form action="main.htm" method="get">
	<table class=" table table tb_costa">
	<caption><h4>Datos del usuario</h4></caption>
		<tr>
			<td>Tipo de Persona: </td>
			<td>${usuario.idtpersona}</td>
		</tr>
		<tr>
			<td>Nombres: </td>
			<td>${usuario.nombre}</td>
		</tr>
		<tr>
			<td>Apellido: </td>
			<td>${usuario.apellido}</td>
		</tr>
		<tr>
			<td>Dni: </td>
			<td>${usuario.dni}</td>
		</tr>
		<tr>
			<td>Email: </td>
			<td>${usuario.email}</td>
		</tr>
		<tr>
			<td>Telefono: </td>
			<td> ${usuario.telefono}</td>
		</tr>
		
	</table>
	</form>
	</div>
	
	<div>
	

	
	</div>
	<div id="pie_pagina">
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>