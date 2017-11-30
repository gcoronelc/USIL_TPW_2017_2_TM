<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="recursos.jsp" />
<title>MANTENIMIENTO DE INMUEBLE</title>
</head>
<body>

	<div class="egcc_cabecera">

		<jsp:include page="cabecera.jsp" />
	</div>
	<div class="egcc_menu">
		<jsp:include page="menu.jsp" />
	</div>
	<div>
		<div>
			<div>
				<div align="center">

					<table align="center">
						<tr>
							<td><form action="verInmueble.htm" method="GET">
									<button type="submit" class="btn btn-default">
										<span></span> Ver Inmuebles
									</button>

								</form></td>
							<td><form action="nuevoInmueble.htm" method="GET">
									&nbsp;&nbsp;
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> Nuevo Inmueble
									</button>
								</form></td>
							<td>&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-body">

				<table class="table table-hover" id="testTable"
					summary="Code page support in different versions of MS Windows."
					rules="groups" frame="hsides">
					<thead>
						<tr align="center">
							<th>Id inmueble</th>
							<th>Piso</th>
							<th>Numero</th>
							<th>Descripcion</th>
							<th>Nombre Propietario</th>
							<th>Apellido Propietario</th>
							<th>Tipo de inmueble</th>
							<th>Torre</th>
							<th>Activo</th>
							<th>Accion</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lista}" var="r">
							<tr>
								<th scope="row">${ r.idinmueble }</th>
								<td>${ r.piso }</td>
								<td>${ r.numero }</td>
								<td>${ r.descripcion }</td>
								<td>${ r.nombre }</td>
								<td>${ r.apellido }</td>
								<td>${ r.nomtinmueble }</td>
								<td>${ r.nomtorre }</td>
								<td>${ r.activo }</td>

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
		<jsp:include page="pie.jsp" />
	</div>
</body>
</html>