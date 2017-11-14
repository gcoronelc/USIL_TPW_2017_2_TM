<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JEAGUER ADMIN</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style type="text/css">
.footer {
	background: -webkit-linear-gradient(#2BB5B7, #000);
	background: -o-linear-gradient(#2BB5B7, #000);
	background: -moz-linear-gradient(#2BB5B7, #000);
	background: linear-gradient(#2BB5B7, #000);
}
</style>
</head>

<body>
	<div class="headeradmin">
		<jsp:include page="headeradmin.jsp" />
	</div>
	<br>
	<br>
	<br>

	<div class="container">
	<h2 class="text-center"><b>LISTADO PROPIETARIOS</b></h2>
		<div class="table-responsive">
		
			<table class="table table-hover text-justify">
				<tr class="text-danger">
					<th>ID</th>
					<th>APELLIDO</th>
					<th>NOMBRE</th>
					<th>DNI</th>
					<th>EMAIL</th>
					<th>TELEFONO</th>
					<th>ESTADO</th>
					<th>ACCION</th>
				</tr>
				<c:forEach items="${lista}" var="r">
					<tr class="text-primary">
						<td>${r.idpro}</td>
						<td>${r.apellido}</td>
						<td>${r.nombre}</td>
						<td>${r.dni}</td>
						<td>${r.email}</td>
						<td>${r.telefono}</td>
						<td>${r.estado}</td>
						<td><a href="mispropiedades.htm?idpro=${r.idpro}">
						<img src="imagenes/iconopropiedades.png" title="Ver Propiedades" height="50px" width="50px"/>
						</a>
						<a href="actualizarpro.htm?idpro=${r.idpro}">
						<img src="imagenes/iconoeditar.png" title="Editar Datos" height="50px" width="50px"/>
						</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
							<a href="javascript:window.history.back();">&laquo; Volver
						atrás</a>
	</div>

	<div class="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>