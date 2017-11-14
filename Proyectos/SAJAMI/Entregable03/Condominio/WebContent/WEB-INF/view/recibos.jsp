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
<script type="text/javascript" language="javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
<script type="text/javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>
<script type="text/javascript">
	function listaRecibos() {
		$.ajax({
			type : "get",
			url : "http://localhost:8080/Condominio/recibos/listarecibos.htm",
			cache : false,
			success : function(data) {
				alert('Proceso OK.')
				$("#result").html(data);
			},
			error : function() {
				alert('Error while request.. ');

			}
		});
	}
</script>
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
					<button class="btn btn-primary" onclick="listaRecibos();">Listar
						Recibos</button>

					<!-- Button trigger modal -->
					<button class="btn btn-primary" data-toggle="modal"
						data-target="#myModalNorm">Registrar Recibos</button>

					<!-- Aqui empieza el result -->
					<div id="result"></div>
					<!-- Aqui termina el result -->


				</div>

			</div>


		</div>



		<!-- Modal -->
		<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>

					<!-- Modal Body -->
					<div class="modal-body">

						<form role="form">
							<div class="form-group">
								<label>Tipo</label> <select class="selectpicker" id="combotipo">
									<option>Mantenimiento</option>
									<option>Agua</option>
									<option>Otros</option>
								</select>

							</div>
							<div class="form-group">
								<label>Codigo</label> <input type="text" class="form-control"
									id="codigo" placeholder="Ingrese codigo de recibo" required="" />
							</div>
							<div class="form-group">
								<label>Año</label> <input type="number" class="form-control"
									id="anio" placeholder="Ingrese el año" required="" />
							</div>
							<div class="form-group">
								<label>Mes</label> <input type="number" class="form-control"
									id="mes" placeholder="Ingrese el mes" required="" />
							</div>
							<div class="form-group">
								<label>Fecha de Vencimiento</label> <input type="date" class="form-control"
									id="anio" placeholder="" required="" />
							</div>
							<div class="form-group">
								<label>Importe</label> <input type="number" class="form-control"
									id="anio" placeholder="Ingrese el importe" required="" />
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>


					</div>

					<!-- Modal Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close</button>
						<button type="submit" class="btn btn-primary">Guardar
							cambios</button>
					</div>
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
			<p class="row main-low-margin">Debido al tipo de inmueble que
				representa la cochera, esta no genera gastos por agua.</p>
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