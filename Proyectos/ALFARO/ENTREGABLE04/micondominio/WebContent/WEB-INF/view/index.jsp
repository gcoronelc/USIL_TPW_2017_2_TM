<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>INICIO DE SESION</title>
<style type="text/css">
#LOGON {
	background-color: #a2a2a2;
	color: #34495e;
	width: 350px;
	margin: 150px auto;
	padding: 5px;
}
</style>
</head>
<body>

	<div id="LOGON">
		<div style="text-align: center;">
			<img src='<c:url value="images/logo3.jpg" />' />
		</div>
		<h1>INICIO DE SESIÓN</h1>

		<c:if test="${ error != null }">
			<div class="egcc_error">${error}</div>
		</c:if>

		<div class="egcc_panel">
			<form method="post" action="ingresar.htm">
				<table>
					<tr>
						<td>Usuario:</td>
						<td><input type="text" name="usuario" /></td>
					</tr>
					<tr>
						<td>Clave:</td>
						<td><input type="password" name="clave" /></td>
					</tr>
				</table>
				<input class="egcc_btn_default" type="submit" align="center"
					value="Ingresar" />
			</form>
		</div>

	</div>


</body>
</html>