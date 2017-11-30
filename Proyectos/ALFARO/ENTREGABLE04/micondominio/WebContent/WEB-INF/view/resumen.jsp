<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="recursos.jsp" />
<title>CONDOSFT-LISTADO DE PROPIETARIO E INMUEBLE</title>
</head>
<body>
	<center>
		<h1>CONDOSFT-LISTADO DE PROPIETARIO E INMUEBLE</h1>
	</center>
	<hr />
	<br />
	<div class="egcc_pagina">

		<center>
			<div class="egcc_cabecera">
				<jsp:include page="cabecera.jsp" />
			</div>
		</center>

		<div class="egcc_menu">
			<jsp:include page="menu.jsp" />
		</div>

		<br /> <br />


		<center>
			<form method="post" accept="resumen.htm">
				<label>DNI:</label> <input type="text" name="DNI" /> <label>PROPIETARIO:</label>
				<input type="text" name="PROPIETARIO" /> <input type="submit"
					value="Consultar" />
			</form>
		</center>
		<hr />

		<center>
			<table>

				<thead>
					<tr>
						<th>CODIGO</th>
						<th>PROPIETARIO</th>
						<th>DNI</th>
						<th>ESTADO</th>
						<th>CANTIDAD_INMUEBLE</th>
						<th>DETALLE</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${sessionScope.resumen}" var="r">
						<tr>
							<td>${r.CODIGO}</td>
							<td>${r.PROPIETARIO}</td>
							<td>${r.DNI}</td>
							<td>${r.ESTADO}</td>
							<td>${r.CANTIDAD_INMUEBLE}</td>
							<td><button type="submit">Detalle</button></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<!-- Detalle -->
			<c:if test="${curso != null}">
				<div>
					<h2>${sessionScope.ciclo}- ${sessionScope.curso}</h2>
					<table border="1">

						<thead>
							<tr>
								<th>CURSO PROG.</th>
								<th>CURSO</th>
								<th>DISPONIBLES</th>
								<th>MATRICULADOS</th>
								<th>HORARIO</th>
								<th>PROFESOR</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${sessionScope.detalle}" var="r">
								<tr>
									<td>${r.cursoprog}</td>
									<td>${r.curso}</td>
									<td>${r.disponibles}</td>
									<td>${r.matriculados}</td>
									<td>${r.horario}</td>
									<td>${r.profesor}</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
			</c:if>
		</center>
</body>
</html>