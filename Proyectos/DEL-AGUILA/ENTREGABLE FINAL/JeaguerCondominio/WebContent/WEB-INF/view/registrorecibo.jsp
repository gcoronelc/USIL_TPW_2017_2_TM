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
			<h2>REGISTRAR RECIBO AGUA</h2>
			<form method="post" action="registrorecibo.htm">
				<div class="col-sm-4">
					<br> Descripcion: <input type="text" name="codigo"
						class="form-control">
				</div>
				<div class="col-sm-4">
					<br> Año: <select id="anio" class="form-control"
						name="anio">
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
					</select>
				</div>
				<div class="col-sm-4">
					<br> Mes: <select id="mes" class="form-control" name="mes">
						<option value="1">Enero</option>
						<option value="2">Febrero</option>
						<option value="3">Marzo</option>
						<option value="4">Abril</option>
						<option value="5">Mayo</option>
						<option value="6">Junio</option>
						<option value="7">Julio</option>
						<option value="8">Agosto</option>
						<option value="9">Setiembre</option>
						<option value="10">Octubre</option>
						<option value="11">Noviembre</option>
						<option value="12">Diciembre</option>
					</select>
				</div>
				<div class="col-sm-4">
					<br> Fecha Vencimiento: <input type="date" name="fvence"
						class="form-control">
				</div>
				<div class="col-sm-4">
					<br> Importe: <input type="text" name="importe"
						class="form-control">
				</div>

				<div class="col-sm-4">
					<br> <br> <input id="btnGrabar" class="btn btn-info"
						type="submit" value="Registrar" />
				</div>
				<div class="col-sm-4">
					<br> <h4 class="text-center text-danger">${mensaje}</h4>
				</div>
			</form>
		</div>
		<br> <br> <br>
		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>
</body>
</html>