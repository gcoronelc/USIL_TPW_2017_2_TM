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
		<h2>Modificar las personas</h2>
		<form name="" action="ModificarPersona.htm" method="post">
		<br/><br>
		<table id="tb_C_timn" class="" border>
		<c:forEach items="${personaAM}" var="inm">
			<tr class="negritaTodas">
				<td>Codigo</td>
				<td>
				<input type="text" value="${inm.idpersona}" name="idpesrsona"/>
				</td>
			</tr>
				<tr>
					<td>Tipo de persona</td>
					<td>
					<input type="text" value="${inm.idtpersona}" name="Idtpersona"/>
					</td>
				</tr>
				<tr>
				<td>Nombres</td>
				<td>
					<input type="text" value="${inm.nombre}" name="nom"/>
				
				</td>
				</tr>
				<tr>
					<td>Apellidos</td>
					<td><input type="text" value="${inm.apellido}" name="apell"/></td>
				<tr>
					<td>Dni</td>
					<td><input type="text" value="${inm.dni}" name="dni"/></td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<input type="text" value="${inm.email}" name="correo"/>
					</td>
				</tr>
				<tr>
					<td>Telefono</td>
					<td><input type="text" value="${inm.telefono}" name="telf"/></td>
				</tr>
				<tr>
					<td>Direccion</td>
					<td>
					<input type="text" value="${inm.direccion}" name="direcc"/>
					</td>
				</tr>
			
			</c:forEach>	
		</table>
				<input type="submit"  value="Modificar"/>
				<input type="reset"  value="Cancelar"/>
		</form>
		</div>
	</div>
	<br>
	<br>
	<div id="pie_pagina">
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
</div>
</body>
</html>