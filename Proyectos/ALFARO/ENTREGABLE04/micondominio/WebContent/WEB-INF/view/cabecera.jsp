<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<table style="width: 100%;">
	<tr>
		<td><img src='<c:url value="/images/logo3.jpg" />' /></td>
		<td>Jefe de proyecto: Gustavo Coronel</br> Analista: Laura Cadenas
			Vergaray<br /> Bases de datos: Jhovana Sulca Jeri<br />
			Documentadora: Alicia Ancasi Vilca<br /> Programadora: Cristina
			Alfaro Velazque(supuestamete)
		</td>
		<td>Usuario: ${usuario.usuario}<br /> <a href="salir.htm">Cerrar
				sesión</a>
		</td>
	</tr>
</table>