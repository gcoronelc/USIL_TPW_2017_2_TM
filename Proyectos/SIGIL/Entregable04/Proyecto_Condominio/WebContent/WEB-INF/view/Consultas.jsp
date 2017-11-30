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
		<h2>Consulta de personas</h2>
		<form action="#" style="padding-bottom: 10px">
		<label>Buscar:</label><input type="text" name="txt_seach_pers" size="40">
		<input type="submit" name="btn_buscar_p" value="Buscar"/>
		</form>
		
		<form name="" action="Consultas.htm" method="post">
		<input type="submit" value="Consultar" >
		<input type="button" value="Nuevo" data-toggle="modal" data-target="#exampleModal"/>		
		<br/>
		<br/>
		<table border id="tb_C_timn" class="table table-striped">				
			<tr>
				<td>Codigo</td>
				<td>Tipo de persona</td>
				<td>Nombres</td>
				<td>dni</td>
				<td>email</td>
				<td>telefono</td>
				<td>direccion</td>
				<td>Acción
				</td>
			</tr>
			<c:forEach items="${persona}" var="dato">
				<tr>
					<td>${dato.idpersona}</td>
					<td>${dato.tipoNombre}</td>
					<td>${dato.apellido} ${dato.nombre}</td>
					<td>${dato.dni}</td>
					<td>${dato.email}</td>
					<td>${dato.telefono}</td>
					<td>${dato.direccion}</td>
					<td><a href="ActualizarPropietario2.htm?cod=${dato.idpersona}">
					<img src="iconos/glyphicons/glyphicons-31-pencil.png" title="Editar "></a>
					<a href="ConsultasDeletePers.htm?cod=${dato.idpersona}">
					<img src="iconos/glyphicons/glyphicons-17-bin.png" title="Eliminar">
					</a>
					</td>
				</tr>
			</c:forEach>
		</table>	
		</form>

		<div id="modal">
			<form action="RegistrarPers.htm" method="get">
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">INGRESAR NUEVA PERSONA</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      	<table>
				      		<tr>
				      			<td style="padding-right: 7px">Tipo de Persona: </td>
				      			<td>
				      				<select name="Idtpersona">
				      					<option value="1">PROPIETARIO</option>
				      					<option value="3">DIRECTIVO</option>
				      					<option value="2">ADMINISTRADOR</option>
				      					<option value="4">SECRETARIA</option>
				      				</select>
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>Nombre:</td>
				      			<td>
				      			<input type="text" name="nom" />
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>Apellidos:</td>
				      			<td>
				      			<input type="text" name="apell" />
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>Dni:</td>
				      			<td>
				      			<input type="text" name="dni" />
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>Email:</td>
				      			<td>
				      			<input type="text" name="correo" />
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>Telefono:</td>
				      			<td>
				      			<input type="text" name="telf" />
				      			</td>
				      		</tr>
				      		<tr>
				      			<td>Dirección:</td>
				      			<td>
				      			<input type="text" name="direcc" />
				      			</td>
				      		</tr>
				      	</table>			     
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				        <input type="submit" value="Guardar" class="btn btn-primary"/>
				      </div>
				    </div>
				  </div>
				</div>
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