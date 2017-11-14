<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>CONDOMINIOS SOFT</title>
<jsp:include page="recursos.jsp" />
</head>
<body>

	<!--Menú-->

	<jsp:include page="menu.jsp"></jsp:include>
	<!--Fin del Menú-->

	<div class="container">
		<div class="row main-low-margin ">

			<div class="col-md-2 col-sm-2"></div>
			<div class="col-md-6 col-md-offset-1">
				<div class="row main-low-margin text-center ">

					<!-- Resumen -->

					<p>${error}</p>
					<form method="post" accept="estadocuenta.htm">
						<input type="text" name="idpersona" value="${usuario.idpersona}"
							style="visibility: hidden;" readonly="readonly" /><br> <input
							type="submit" class="btn btn-primary"
							value="Listar mi estado de Cuenta" />
					</form>

					<table class="table table-responsive">

						<thead class="thead-default">
							<tr>
								<th>Id Obligacion</th>
								<th>Tipo de Obligacion</th>
								<th>Id Inmueble</th>
								<th>Descripcion</th>
								<th>Año</th>
								<th>Mes</th>
								<th>Importe</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${sessionScope.listadeudas}" var="r">

								<tr>
									<td>${r.idobligacion}</td>
									<td>${r.nombre}</td>
									<td>${r.idinmueble}</td>
									<td>${r.descripcion}</td>
									<td>${r.anio}</td>
									<td>${r.mes}</td>
									<td>${r.importe}</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

					</div>

			</div>


		</div>
		<div class="col-md-2 col-sm-2"></div>


	</div>
	<div class="row main-low-margin text-center ">
		<div class="col-md-3 col-sm-3"></div>
		<div class="col-md-3 col-sm-3">
			<i class="fa fa-exclamation-circle fa-5x"></i>
			<h3>Importante</h3>
			<p class="row main-low-margin">Debido al tipo de inmueble
			que representa la cochera, esta no genera gastos por agua.
			</p>
		</div>
		<div class="col-md-3 col-sm-3 text-center">
			<i class="fa fa-times-circle-o fa-5x "></i>
			<h3>Cancelaciones</h3>
			<p class="row main-low-margin">Si deseas cancelar el evento, se
				requiere minimo 1 dia de antelacion y se considerara un pago por
				administracion.</p>
		</div>
		<div class="col-md-3 col-sm-3"></div>


	</div>





	<div class="space-bottom"></div>


	<div class="content"></div>

	<jsp:include page="pie.jsp"></jsp:include>

</body>
</html>