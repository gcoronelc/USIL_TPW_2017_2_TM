<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<table style="width: 100%;">
	<tr>
		<td><img src='<c:url value="/img/logo.jpg" />' /></td>
		<td>
			Usuario: ${usuario.nombre} - ${usuario.apellido}<br/>
			<a href="salir.htm">Cerrar sesi�n</a> 
		</td>
	</tr>
</table>