<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MANTENIMIENTO DE PERSONAS</title>
</head>
<body>
	<h1>MANTENIMIENTO DE PERSONAS</h1>

	<div id="divConsulta">

		<form id="form1">
			<table>
				<tr>
					<td>Apellido</td>
					<td>Nombre</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="apellido" /></td>
					<td><input type="text" name="nombre" /></td>
					<td><input id="btnConsultar" type="button" value="Consultar" />
						<input id="btnNuevo" type="button" value="Nuevo" /></td>
				</tr>
			</table>

			<h2>LISTADO DE PERSONAS</h2>
			<table border="1">

				<thead>
					<tr>
						<th>ID</th>
						<th>APELLIDO</th>
						<th>NOMBRE</th>
						<th>ACCIONES</th>
					</tr>
				</thead>
				<tbody id="tabla">
				</tbody>
			</table>
		</form>

	</div>

	<div id="divNuevo" class="egcc_panel" style="display: none;">

		<h2>INSERTAR PERSONA</h2>

		<form id="formInsertar">
			<table>
				<tr>
					<td>Apellido:</td>
					<td><input type="text" name="apellido" /></td>
				</tr>
				<tr>
					<td>Nombre:</td>
					<td><input type="text" name="nombre" /></td>
				</tr>
				<tr>
					<td>Tipo:</td>
					<td><input type="text" name="tipo" /></td>
				</tr>
				<tr>
					<td>DNI:</td>
					<td><input type="text" name="dni" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td>Telefono:</td>
					<td><input type="text" name="telefono" /></td>
				</tr>
				<tr>
					<td>Dirección:</td>
					<td><input type="text" name="direccion" /></td>
				</tr>
				<tr>
					<td>Estado:</td>
					<td><input type="text" name="estado" /></td>
				</tr>
			</table>
			<br /> <input id="btnInsertarGrabar" type="button" value="Grabar" />
			<input id="btnInsertarCancelar" type="button" value="Cancelar" />
		</form>


	</div>


	<script>
		$("#btnConsultar").click(fnConsultar);
		$("#btnNuevo").click(fnNuevo);

		// Insertar
		$("#btnInsertarCancelar").click(fnInsertarCancelar);
		$("#btnInsertarGrabar").click(fnInsertarGrabar);

		function fnInsertarCancelar() {
			$("#divConsulta").show();
			$("#divNuevo").hide();
		}

		function fnInsertarGrabar() {

			var data = $("#formInsertar").serialize();
			$.post("personaInsertar.htm", data, function(jsonResponse) {

				var mensaje = $.parseJSON(jsonResponse);

				alert(mensaje.mensaje);

				if (mensaje.code == 1) {
					$("#divConsulta").show();
					$("#divNuevo").hide();
				}

			});

		}

		// FUNCIONES

		function fnNuevo() {
			$("#divConsulta").hide();
			$("#divNuevo").show();
		}

		function fnConsultar() {

			var data = $("#form1").serialize();
			$.get("personaTraerVarios.htm", data, function(jsonResponse) {
				$("#tabla").html("");
				var arreglo = $.parseJSON(jsonResponse);

				$.each(arreglo, function(i, persona) {

					var fila = "<tr>";
					fila += "<td>" + persona.idpersona + "</td>";
					fila += "<td>" + persona.apellido + "</td>";
					fila += "<td>" + persona.nombre + "</td>";
					fila += "<td>Falta</td>";
					fila += "</tr>";
					$("#tabla").append(fila);

				});

			});

		}
	</script>
</body>
</html>