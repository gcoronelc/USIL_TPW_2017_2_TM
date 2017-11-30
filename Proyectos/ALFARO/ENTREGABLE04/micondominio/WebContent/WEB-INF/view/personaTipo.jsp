<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="recursos.jsp" />
<title>Propietario</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<form method="post" action="personaTipo.htm">
		<label>Tipo de Persona:</label> <select name="nombre">
			<option value="0000">Seleccione</option>

			<c:forEach items="${ nombres}" var="r">
				<option value="${r}">${r}</option>
			</c:forEach>

		</select> <input type="submit" value="Consultar" />
	</form>
	<hr />

	<table border="1">

		<thead>
			<tr>
				<th>CODIGO</th>
				<th>COD_TPERSONA</th>
				<th>APELLDOS</th>
				<th>NOMBRES</th>
				<th>DNI</th>
				<th>EMAIL</th>
				<th>TELEFONO</th>
				<th>DIRECCION</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach items="${lista}" var="r">
				<tr>
					<td>${ r.idpersona }</td>
					<td>${ r.nombre }</td>
					<td>${ r.apellido }</td>
					<td>${ r.nombre }</td>
					<td>${ r.dni }</td>
					<td>${ r.email }</td>
					<td>${ r.telefono }</td>
					<td>${ r.direccion }</td>
				</tr>
			</c:forEach>

		</tbody>


	</table>

</body>
</html>