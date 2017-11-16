<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="recursos.jsp"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LISTA DE PROPIETARIO</title>
</head>
<body>
 <div class="egcc_pagina">
 
    <div class="egcc_cabecera">
      <jsp:include page="cabecera.jsp"/>
    </div>
	<div class="egcc_menu">
		<jsp:include page="menu.jsp" />
	</div>
	<div class="container">
	<div class="panel panel-default">
			<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Id Inmueble</th>
					<th>Piso</th>
					<th>Numero de habitacion</th>
					<th>Descripcion</th>
					<th>Tipo de inmueble</th>
					<th>Torre</th>
					<th>Estado</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${sessionScope.lista}" var="r">
				<tr>
					<th scope="row">${r.idinmueble }</th>
					<td>${r.piso }</td>
					<td>${r.numero }</td>
					<td>${r.descripcion }</td>
					<td>${r.nomtinmueble }</td>
					<td>${r.nomtorre }</td>
					<td>${r.activo }</td>
					</tr>
					</c:forEach>
				<tr align="center">
				<td align="center" colspan="7">
				<div class="form-group" align="center">
						<div class="col-xs-offset-3 col-xs-6">
						<input  class="btn btn-primary" type="button" onclick="history.back()" name="atrás" value="volver atrás">
						</div>
						</div>
				</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	</div>
	 <div class="egcc_pie">
      <jsp:include page="pie.jsp"/>
    </div>
</body>

</html>