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


	function madeAjaxCall(va){
		var id=$(va).text();
		 $.ajax({
		  type: "get",
		  url: "http://localhost:8080/Condominio/inmuebles/detinmuebles.htm",
		  cache: false,    
		  data:'idinmueble=' + id,
		  success: function(data){
			  $("#result").html(data);
			 },
		  error: function(){      
		   alert('Error while request.. '+id);
		   
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
					<form method="post" accept="inmuebles.htm">
						<input type="text" name="idpersona" value="${usuario.idpersona}"
							style="visibility: hidden;" readonly="readonly" /><br> <input
							type="submit" class="btn btn-primary"
							value="Listar mis inmuebles" />
					</form>

					<table class="table table-responsive">

						<thead class="thead-default">
							<tr>
								<th>Id Inmueble</th>
								<th>Piso</th>
								<th>Numero</th>
								<th>Descripcion</th>
								<th>Dueño</th>
								<th>Tipo de inmueble</th>
								<th>Torre</th>
								<th>Detalles</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${sessionScope.linmuenbles}" var="r">

								<tr>

									<td id="col${r.idinmueble}">${r.idinmueble}</td>
									<td>${r.piso}</td>
									<td>${r.numero}</td>
									<td>${r.descripcion}</td>
									<td>${r.dueno}</td>
									<td>${r.tinmueble}</td>
									<td>${r.ntorre}</td>
									<td><button onclick="madeAjaxCall(col${r.idinmueble});"
											class="btn btn-info" data-toggle="modal" 
											data-target="#myModal">Detalles</button></td>

								</tr>
							</c:forEach>
						</tbody>

					</table>

					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Detalles de Inmueble</h4>
								</div>
								<div class="modal-body">
											<!-- Aqui empieza el result -->
											<div id="result"></div>
											<!-- Aqui termina el result -->
										
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
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