<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VENTA</title>
<link rel="stylesheet" href="css/estilos.css">
<script type="text/javascript" src="jquery/jquery.js" ></script>
<script type="text/javascript" src="service/ServicioVenta.js" ></script>
</head>
<body>
	<h1>APRENDIENDO JQUERY</h1>
	<div>
		<button class="botonActive" id="btnProcesar" type="button">Procesar</button>
		<button class="botonDisable" id="btnNuevo" type="button">Nuevo</button>
	</div>
	<div id="divForm">
		<h2>DATOS DEL REQUERIMIENTO</h2>
		<form>
			<table>
				<tr>
					<td>Precio:</td>
					<td><input type="text" id="precio" name="precio"/></td>
				</tr>
				<tr>
					<td>Cantidad:</td>
					<td><input type="text" id="cant" name="cant"/></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="divRepo">
		<h2>REPORTE</h2>
		<table>
			<tr>
				<td colspan="2">INPUT</td>
			</tr>
			<tr>
				<td>Precio</td>
				<td><span id="repoPrecio"></span></td>
			</tr>
			<tr>
				<td>Cantidad</td>
				<td><span id="repoCant"></span></td>
			</tr>
			<tr>
				<td colspan="2">OUTPUT</td>
			</tr>
			<tr>
				<td>Importe</td>
				<td><span id="repoImporte"></span></td>
			</tr>
			<tr>
				<td>Impuesto</td>
				<td><span id="repoImpuesto"></span></td>
			</tr>
			<tr>
				<td>Importe</td>
				<td><span id="repoTotal"></span></td>
			</tr>
		</table>
	</div>

	<script>

		// Init Page
		btnNuevoClick();
		
		// Programando los botones
		$("#btnProcesar").click(btnProcesarClick);
		$("#btnNuevo").click(btnNuevoClick);

		// Las funciones
		function btnProcesarClick(){
			// Datos
			var precio = parseFloat($("#precio").val());
			var cant = parseInt($("#cant").val());
			// Proceso
			ventaModel = {"precio":precio,"cant":cant,"importe":0,"impuesto":0,"total":0};
			ventaModel = procesarVenta(ventaModel);
			// Reporte
			$("#repoPrecio").text(ventaModel.precio);
			$("#repoCant").text(ventaModel.cant);
			$("#repoImporte").text(ventaModel.importe);
			$("#repoImpuesto").text(ventaModel.impuesto);
			$("#repoTotal").text(ventaModel.total);
			$("#divForm").hide();
			$("#divRepo").show();
			$("#btnProcesar").removeClass();
			$("#btnProcesar").addClass("botonDisable");
			$("#btnNuevo").removeClass();
			$("#btnNuevo").addClass("botonActive");
		}

		function btnNuevoClick(){
			$("#precio").val("");
			$("#cant").val("");
			$("#divForm").show();
			$("#divRepo").hide();
			$("#btnProcesar").removeClass();
			$("#btnProcesar").addClass("botonActive");
			$("#btnNuevo").removeClass();
			$("#btnNuevo").addClass("botonDisable");
		}

	</script>
</body>
</html>