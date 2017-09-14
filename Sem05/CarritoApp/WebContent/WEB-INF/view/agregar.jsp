<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AGREGAR ITEM</title>
</head>
<body>
	
	<!-- Parte comun para todas las páginas -->
	<div>
		<jsp:include page="titulo.jsp"/>
	</div>
	<div>
		<jsp:include page="menu.jsp"/>
	</div>
	
	<!-- Formulario -->
	
	<h2>Agregar Item</h2>
	
	<p>Mensaje: ${mensaje}</p>
	
	<form method="post" action="agregar.htm">
	
		<table>
		
			<tr>
				<td>Producto:</td>
				<td><input type="text" name="producto"/></td>
			</tr>
			
			<tr>
				<td>Precio:</td>
				<td><input type="text" name="precio"/></td>
			</tr>
				
			<tr>
				<td>Cantidad:</td>
				<td><input type="text" name="cant"/></td>
			</tr>					

			<tr>
				<td><input type="submit" value="Grabar"/></td>
			</tr>
					
		</table>
	
	</form>
	
	
</body>
</html>
