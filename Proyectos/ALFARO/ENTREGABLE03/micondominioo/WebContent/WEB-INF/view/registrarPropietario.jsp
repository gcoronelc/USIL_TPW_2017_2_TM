<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="recursos.jsp"/>
<title>REGISTRAR PROPIETARIO</title>
</head>
<body>
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
							<td><form action="verPropietario.htm" method="POST">

									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-eye-open"></span> Ver
										Propietario
									</button>

								</form></td>&nbsp;&nbsp;
							<td><form action="nuevo.htm" method="GET">
									&nbsp;&nbsp;
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> Nuevo
										Propietario
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
				<table class="table table-hover" id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides">
					<thead>
						<tr  align="center">
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>dni</th>
							<th>email</th>
							<th>telefono</th>
							<th>direccion</th>
							<th>accion</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lista}" var="r">
							<tr>
								<th scope="row">${ r.idpersona }</th>
								<td>${ r.nombre }</td>
								<td>${ r.apellido }</td>
								<td>${ r.dni }</td>
								<td>${ r.email }</td>
								<td>${ r.telefono }</td>
								<td>${ r.direccion }</td>
								<td><a href="#"><span
										class="glyphicon glyphicon-pencil"></span></a> &nbsp;&nbsp;&nbsp;
									<a href="verPropiedades.htm?idpersona=${r.idpersona} "><span
										class="glyphicon glyphicon-stats"></span></a>&nbsp;&nbsp;&nbsp; <a
									href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	 <div class="egcc_pie">
      <jsp:include page="pie.jsp"/>
    </div>
</body>
</html>