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
		<h2>Listar Inmueble</h2>
	
		<form name="" action="listarPropietario.htm" method="post">
		<input type="submit" value="Consultar" >
		<input type="button" value="Nuevo" data-toggle="modal" data-target="#exampleModal">
		<br/><br>
		<table id="tb_C_timn" class="table table-striped" border>
				
			<tr class="negritaTodas">
				<td>Codigo</td>
				<td>Inmueble</td>
				<td>Dueño</td>
				<td>Descripcion</td>
				<td>Piso</td>
				<td>Numero</td>
				<td>Torre</td>
				<td>Activo</td>
				<td>Accion</td>
				
			</tr>
			
			<c:forEach items="${propietario}" var="dato">
				<tr>
					<td>${dato.idinmueble}</td>
					<td>${dato.NomInmueble}</td>
					<td>${dato.nombre } ${dato.apellido}</td>
					<td>${dato.descripcion}</td>
					<td>${dato.piso}</td>
					<td>${dato.numero}</td>
					<td>${dato.torre}</td>
					<td>${dato.activo}</td>
					<td>
					<a href="LlenarDAtos.htm?idinmueble=${dato.idinmueble}">
					<img src="iconos/glyphicons/glyphicons-31-pencil.png" title="Editar "></a>
					<a href="EliminarInmueble.htm?idinmueble=${dato.idinmueble}">
					<img src="iconos/glyphicons/glyphicons-17-bin.png" title="Eliminar">
					</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</form>
		
		<div id="modal">
			<form action="RegistrarInmueble.htm"  method="get">
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
				      		<table style="padding:10px;">
				      			<tr>
				      				<td>Codigo Persona</td>
				      				<td>
				      					<input required type="text" name="perNombre" >
				      				</td>
				      			</tr>
				      			<tr>
				      				<td>Inmueble</td>
				      				<td>
				      					<select name="cmb_inmueble">
				      						<option value="1">CONDOMINIO</option>
				      						<option value="2">DEPARTAMENTO</option>
				      						<option value="3">OFICINA</option>
				      						<option value="4">COCHERA</option>
				      						<option value="5">AUDITORIO</option>
				      					</select>
				      				</td>
				      			</tr>
				      			<tr>
				      				<td>Descripción</td>
				      				<td>
				      					<textarea rows="4" cols="25" name="descrip"></textarea>
				      				</td>
				      			</tr>
				      			<tr>
				      				<td>Torre</td>
				      				<td>
				      					<select name="cmbTorre">
				      						<option value="1">Torre A</option>
				      						<option value="2">Torre B</option>
				      						<option value="3"> Torre C</option>
				      					</select>
				      				</td>
				      			</tr>
				      			<tr>
				      				<td>Numero de piso</td>
				      				<td>
				      					<select name="piso">
				      						<option value="-1">-1</option>
				      						<option value="2">2</option>
				      						<option value="3">3</option>
				      						<option value="4">4</option>
				      						<option value="5">5</option>
				      						<option value="6">6</option>
				      						<option value="7">7</option>
				      						<option value="8">8</option>
				      						<option value="9">9</option>
				      						<option value="10">10</option>
				      					</select>
				      				</td>
				      			</tr>
				      			<tr>
				      				<td>Numero de Inmueble</td>
				      				<td>
				      					<input required type="text" name="num_imn">
				      				</td>
				      			</tr>
				      			<tr>
				      				<td>Activo</td>
				      				<td>
				      					<input type="radio" value="1"  name="radio_estado"/>Si
				      					<input type="radio" value="0" name="radio_estado" />No
				      				</td>
				      			</tr>
				      		</table>
				      </div>
				      <div class="modal-footer">
				        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
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