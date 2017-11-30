<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
body{
	background-color:#ffd9aa;}
.btnMicuenta{
	margin-left: 30px;}
#table_pers{
padding: 20px;}

#tb_C_timn tr td{
padding: 5px;}
</style>
</head>
<body>
<div class="container">
	<div>
	<jsp:include page="cabezera.jsp"></jsp:include>
	</div>
	
	<div id="cotenido" class="container">
		<h2>Actualizar y Eliminar Inmueble</h2>
		<form action="Modifcar.htm" method="post">
		<c:forEach items="${inmueble}" var="inm">
			<table id="table_pers">
			<tr style="">
				<td>Cod</td>
				<td><input type="text" name="idinmueble" value="${inm.idinmueble}" /></td>
			</tr>
			<tr>
				<td>Codigo Persona</td>
				<td><input type="text" name="idtpersona" value="${inm.nombre} ${inm.apellido}" /></td>
			</tr>
			<tr>
				<td>Inmueble</td>
				<td><input type="text" name="nombres" value="${inm.NomInmueble}"/></td>	
			</tr>
			<tr>
				<td>Descripción</td>
				<td><input type="text" name="descrip" value="${inm.descripcion}"/></td>	
			</tr>
			<tr>
				<td>Torre</td>
				<td><input type="text" name="dni" value="${inm.torre}"/></td>
			</tr>
			<tr>
				<td>Numero de piso</td>
				<td><input type="text" name="email" value="${inm.piso}"/></td>
			</tr>
			<tr>
			<td>Numero de Inmueble</td>
				<td><input type="text" name="numero" value="${inm.numero}"/></td>
			</tr>
			<tr>
				<td>Activo</td>
				<td>
				<c:set var="act" value="${inm.activo}"></c:set>
				<c:if test="${act==1 }">
				<input type="radio" name="cmb_estado" value="1" checked="checked"/>Activo
				<input type="radio" name="cmb_estado" value="0" />No Activo
				</c:if>
				<c:if test="${act==0}">
					<input type="radio" name="cmb_estado" value="1"/>Activo
					<input type="radio" name="cmb_estado" value="0" checked="checked" />No Activo
				</c:if>
				</td>
			</tr>
			<tr>
				<td>
				<input type="submit" name="btn_updatePerson" value="Modicar" />
				</td>
				<td>
				<input type="reset" name="btn_volver" value="Cancelar" />
				</td>
			</tr>
			</table>
		</c:forEach>
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