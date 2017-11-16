<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="recursos.jsp"/>
<title>MANTENIMIENTO DE USUARIO</title>
</head>
<body >
 <div class="egcc_pagina">
<div class="egcc_cabecera">
      <jsp:include page="cabecera.jsp"/>
    </div>
	<div class="egcc_menu">
		<jsp:include page="menu.jsp" />
		</div>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="btn-toolbar" role="toolbar" align="center">

					<table align="center">
						<tr>
							<td><form action="verInmueble.htm" method="GET">

									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-eye-open"></span> Ver
										usuarios
									</button>

								</form></td>&nbsp;&nbsp;
							<td><form action="nuevoInmueble.htm" method="GET">
									&nbsp;&nbsp;
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> Nuevo Usuario
									</button>
								</form></td>
							<td>&nbsp;&nbsp;
								<button type="button" class="btn btn-default" id="btnExport"
									onclick="tableToExcel('testTable', 'W3C Example Table')">
									<span class="glyphicon glyphicon-open"></span> Exportar
								</button>
							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-body">
		</div>
	</div>
	 <div class="egcc_pie">
      <jsp:include page="pie.jsp"/>
    </div>
</body>
</html>