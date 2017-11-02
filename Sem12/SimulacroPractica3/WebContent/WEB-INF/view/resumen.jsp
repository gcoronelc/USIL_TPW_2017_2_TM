<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RESUMEN POR CURSO</title>
</head>
<body>

	<h1>RESUMEN POR CURSO</h1>
	<hr/>
	<form method="post" accept="resumen.htm">
		<label>Ciclo:</label>
		<input type="text" name="ciclo"/>
		<input type="submit" value="Consultar" />
	</form>
	<hr/>
	
	<table>
	
		<thead>
			<tr>
				<th>CICLO</th>
				<th>CURSO</th>
				<th>SECCIONES</th>
				<th>INGRESOS</th>
			</tr>
		</thead>
	
		<tbody>
			<c:forEach items="${lista}" var="r">
			<tr>
				<th>${r.ciclo}</th>
				<th>${r.curso}</th>
				<th>${r.secciones}</th>
				<th>${r.ingresos}</th>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

</body>
</html>