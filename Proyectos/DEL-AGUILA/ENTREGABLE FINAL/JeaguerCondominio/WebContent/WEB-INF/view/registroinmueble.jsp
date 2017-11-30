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
<!--  <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>-->
<jsp:include page="recursos.jsp" />
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
		<div class="row">
			<h2>REGISTRO DE INMUEBLE</h2>
<form method="post" action="registroinmueble.htm">
			<div class="col-sm-4">
				<br> Piso: <input type="text" class="form-control" name="piso">
			</div>
			<div class="col-sm-4">
				<br> Numero: <input type="text" class="form-control"
					name="numero">
			</div>
			<div class="col-sm-4">
				<br> Descripcion: <input type="text" class="form-control"
					name="descripcion">
			</div>
			<div class="col-sm-4">
				<br> Tipo Inmueble: <select class="form-control"
					name="idtinmueble">
					<option value="Seleccionar">Seleccionar</option>
					<c:forEach items="${lista}" var="r">
						<option value="${r.idtinmueble}">${r.nombre}</option>
					</c:forEach>
				</select>
			</div>
						<div class="col-sm-4">
				<br> Torre: <select class="form-control"
					name="idtorre">
					<option value="Seleccionar">Seleccionar</option>
					<c:forEach items="${listatorre}" var="l">
						<option value="${l.idtorre}">${l.nombre}</option>
					</c:forEach>
				</select>
			</div>
									<div class="col-sm-4">
				<br> Propietario: <select class="form-control"
					name="idpro">
					<option value="0">Seleccionar</option>
					<c:forEach items="${listapro}" var="li">
						<option value="${li.idpro}">${li.nombre}-${li.apellido}</option>
					</c:forEach>
				</select>
			</div>
						<div class="col-sm-4">
				<br> <br> <input type="submit" class="btn btn-info"
					value="Registrar">
			</div>
									<div class="col-sm-4">
				<br> <br> <h3 class="text-center text-danger">${mensaje}</h3>
			</div>
</form>
		</div>
	</div>

	<br>
	<br>
	<br>
	<div class="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>