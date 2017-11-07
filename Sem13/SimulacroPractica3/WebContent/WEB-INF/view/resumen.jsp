<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Last-Modified" content="0">
<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
<meta http-equiv="Pragma" content="no-cache">
<title>RESUMEN POR CURSO</title>
</head>
<body>

	<h1>RESUMEN POR CURSO</h1>
	<hr/>
	<form method="post" accept="resumen.htm">
		<label>Ciclo:</label>
		<input type="text" name="ciclo" value="${sessionScope.ciclo}"/>
		<input type="submit" value="Consultar" />
	</form>
	<hr/>
	
	<!-- Resumen -->
	<table border="1">
	
		<thead>
			<tr>
				<th>CICLO</th>
				<th>CURSO</th>
				<th>SECCIONES</th>
				<th>VAC.PROG</th>
				<th>MATRICULADOS</th>
				<th>INGRESOS</th>
				<th>DETALLE</th>
			</tr>
		</thead>
	
		<tbody>
			<c:forEach items="${sessionScope.resumen}" var="r">
			<tr>
				<td>${r.ciclo}</td>
				<td>${r.curso}</td>
				<td>${r.secciones}</td>
				<td>${r.vacantes}</td>
				<td>${r.matriculados}</td>
				<td>${r.ingresos}</td>
				<td><a href="detalle.htm?ciclo=${r.ciclo}&curso=${r.curso}">Detalle</a></td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

	<!-- Detalle -->
	<c:if test="${curso != null}">
	<div>
	<h2>${sessionScope.ciclo} - ${sessionScope.curso}</h2>
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
</body>
</html>