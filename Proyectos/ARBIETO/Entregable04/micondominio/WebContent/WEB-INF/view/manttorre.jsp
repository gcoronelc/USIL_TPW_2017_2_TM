<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Torre</title>
</head>
<body>
	<div id="divConsulta">
		<form id="form1">
		<table>
				<tr>
				</tr>
				<tr>
					<td><input type="text" name="nombre" /></td>
					<td><input id="btnConsultar" type="button" value="Consultar" />
						<input id="btnNuevo" type="button" value="Nuevo" /></td>
				</tr>
			</table>
			<h2>LISTADO TORRE</h2>
			<table border="1">

				<thead>
					<tr>
						<th>ID</th>
						<th>NOMBRE</th>
						<th>ACCIONES</th>
					</tr>
				</thead>
				<tbody id="tabla">
				</tbody>
			</table>
		</form>
	</div>
	<h1>Mantenimiento de Torre</h1>
	<div id="divNuevo" class="egcc_panel" style="display: none;">
		<h2>Insertar Inmueble</h2>
		<form id="formInsertar">
			<table>
				<tr>
					<td>Codigo</td>
					<td><input type="text" name="idtorre" id="idtorre"></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" ></td>
				</tr>

			</table>
			<br> <input id="btnGrabar" type="button" value="Grabar" />
			<input id="btnInsertarCancelar" type="button" value="Cancelar" />
		</form>
	</div>
	
	 <div id="divRecord" style="display: none;">
      <h1><span id="spanAccion"></span> EMPLEADO</h1>
      <form id="recForm" method="post" action="#">
        <fieldset class="egcc-form">
          <legend>Datos</legend>
          
          <!-- Controles Ocultos  -->
          <input type="hidden" name="codigo" id="codigo"/>
          <input type="hidden" name="accion" id="accion"/>
          
          <div class="field">
            <label>Código Torre:</label>
            <span id="spancodigo"></span>
          </div>

          <div class="field">
            <label>Nombre:</label>
            <input type="text" name="nombre" id="nombre" size="50"/>
          </div>
      <br> <input id="btnActualizar" type="button" value="Actualizar" />
          
        </fieldset>
         </form>
    </div>
	<script>
		$("#btnGrabar").click(fnGrabar);
		$("#btnConsultar").click(fnConsultar);
		
		$("#btnNuevo").click(fnNuevo);
		$("#btnInsertarCancelar").click(fnInsertarCancelar);
		
		function fnInsertarCancelar() {
			$("#divConsulta").show();
			$("#divNuevo").hide();
		}
		
		function fnGrabar() {
			var data = $("#formInsertar").serialize();
			$.post("insertarTorre.htm", data, function(jsonResponse) {
				var mnje = $.parseJSON(jsonResponse);
				alert(mnje.mensaje);
				if(mnje.code == 1){
					$("#divConsulta").show();					
				  $("#divNuevo").hide();
				  fnConsultar();
				}
				
			});
			
		}
		function fnNuevo() {
			$("#divConsulta").hide();
			$("#divNuevo").show();
		}
		
		function fnConsultar() {

			var data = $("#form1").serialize();
			$.get("traertodos.htm", data, function(jsonResponse) {
				$("#tabla").html("");
				var arreglo = $.parseJSON(jsonResponse);

				$.each(arreglo, function(i, torre) {

					var fila = "<tr>";
					fila += "<td>" + torre.idtorre + "</td>";
					fila += "<td>" + torre.nombre + "</td>";
					fila += "<td><a href='javascript: fnEditar(\""+ torre.idtorre+ "\");'title='Editar registro.' >Editar</a></td>";
					fila += "</tr>";
					$("#tabla").append(fila);

				});

			});
			  function fnCargarRegistro(codigo){
				  var data = "codigo=" + codigo;
				  $("#divRecord").show("slow");
			  }
			function fnEditar(){				
				$("#divRecord").show();
				
			}

		}
	</script>
</body>
</html>