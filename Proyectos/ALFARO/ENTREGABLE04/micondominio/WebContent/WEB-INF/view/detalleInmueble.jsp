<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="recursos.jsp" />
<title>CONDOSOFT-DETALLE INMUEBLE</title>
</head>
<body>


	<jsp:include page="menu.jsp"></jsp:include>

	<form method="post" action="detalleInmueble.htm">

		<label>Torre:</label> <select name="nomTorre">
			<option value="0000">Seleccione</option>

			<c:forEach items="${ nombres}" var="r">
				<option value="${r}">${r}</option>
			</c:forEach>

		</select> <label>Codigo Propietario</label> <input type="text"
			name="codPersona" /> <input type="submit" value="Consultar" />
	</form>
	<hr />

	<table border="1">

		<thead>
			<tr>
				<th>codInmueble</th>
				<th>codPersona</th>
				<th>nomTipoInmueble</th>
				<th>nomTorre</th>
				<th>piso</th>
				<th>numero</th>
				<th>descripcion</th>
				<th>estado</th>
				<th>agua</th>
				<th>mantenimiento</th>
				<th>costoMantenimiento</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach items="${lista}" var="r">
				<tr>
					<td>${ r.codInmueble}</td>
					<td>${ r.codPersona}</td>
					<td>${ r.nomTipoInmueble}</td>
					<td>${ r.nomTorre}</td>
					<td>${ r.piso }</td>
					<td>${ r.numero }</td>
					<td>${ r.descripcion}</td>
					<td>${ r.estado }</td>
					<td>${ r.agua }</td>
					<td>${ r.mantenimiento}</td>
					<td>${ r.costoMantenimiento}</td>
				</tr>
			</c:forEach>

		</tbody>


	</table>


</body>
</html>