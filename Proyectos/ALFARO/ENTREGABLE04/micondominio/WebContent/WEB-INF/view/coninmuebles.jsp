<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONSULTA DE INMUEBLES</title>
</head>
<body>
	<h1>CONSULTA DE INMUEBLES</h1>
	<form id="form1">
		<table>
			<tr>
				<td>T. Inmueble</td>
				<td>Torre</td>
				<td>Propietario</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="text" name="tipo" /></td>
				<td><input type="text" name="torre" /></td>
				<td><input type="text" name="propietario" /></td>
				<td><input id="btnConsultar" type="button" value="Consultar" /></td>
			</tr>
		</table>
	</form>

	<h2>CONDOMINIOS</h2>

	<table border="1">

		<thead>
			<tr>
				<th>ID</th>
				<th>TIPO</th>
				<th>TORRE</th>
				<th>PISO</th>
				<th>NUMERO</th>
				<th>DESCRIPCION</th>
				<th>PROPIETARIO</th>
				<th>AGUA</th>
				<th>MANTE</th>
				<th>CUOTA</th>
				<th>ACTIVO</th>
			</tr>
		</thead>

		<tbody id="tabla">
		</tbody>

	</table>



	<script>
		$("#btnConsultar").click(fnConsultar);

		function fnConsultar() {

			var data = $("#form1").serialize();
			$("#tabla").html("");
			$.post("coninmuebles.htm", data, fnProccessReaponse);

		}

		function fnProccessReaponse(response) {
			var arreglo = $.parseJSON(response);
			$.each(arreglo, function(index, r) {

				var row = "<tr>";
				row += "<td>" + r.inmueble + "</td>";
				row += "<td>" + r.nomtipo + "</td>";
				row += "<td>" + r.nomtorre + "</td>";
				row += "<td>" + r.torre + "</td>";
				row += "<td>" + r.piso + "</td>";
				row += "<td>" + r.numero + "</td>";
				row += "<td>" + r.descripcion + "</td>";
				row += "<td>" + r.nompropietario + "</td>";
				row += "<td>" + r.agua + "</td>";
				row += "<td>" + r.mantenimiento + "</td>";
				row += "<td>" + r.activo + "</td>";
				row += "</tr>";

				$("#tabla").append(row);

			});
		}
	</script>

</body>
</html>