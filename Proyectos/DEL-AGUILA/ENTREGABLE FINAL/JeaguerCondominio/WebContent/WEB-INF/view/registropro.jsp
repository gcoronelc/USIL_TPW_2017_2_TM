<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JEAGUER ADMIN</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style type="text/css">
.footer {
	background: -webkit-linear-gradient(#2BB5B7, #000);
	background: -o-linear-gradient(#2BB5B7, #000);
	background: -moz-linear-gradient(#2BB5B7, #000);
	background: linear-gradient(#2BB5B7, #000);
	width: 100%;
}

.fondo{
	background-size: cover;
	margin-left: auto;
	margin-right: auto;
}

label{
	margin-bottom: 5px;
}

/* LETRAS DE */
input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}


/* CENTRADO Y SOBREFONDO */
.main-login{
    opacity: 0.9;
 	background-color:#E1E6F0;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
    margin-bottom: 50px;
    margin: 0 auto;
    padding: 40px 40px;

}

span.input-group-addon  { /*COLOR DE LOS ICONOS */
    color: #0250AC;
    font-size: 17px;
}

.btn {
    font-size: 20px;
    margin: 0 auto;

}

</style>
</head>

<body>
	<div class="headeradmin">
		<jsp:include page="headeradmin.jsp" />
	</div>
	<br>
	<br>
	<br>

	<div class="container">

		<div class="fondo">

			<div class="main-login main-center">
				<form method="Post" action="registropropietario.htm">
					<!-- GRUPO B -->
					<center>
						<h2>
							<b>Datos del Propietario</b>
						</h2>
					</center>
					<br>

					<div class="container">
						<center>
							<div class="row">
								<!-- LADO IZQUIERDO -->
								<div class="col-sm-5">
									Apellido
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-user"></span>
										<input type="text" class="form-control" name="apellido"
											required>

									</div>
									<br> Nombre
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-user"></span>
										<input type="text" class="form-control" name="nombre" required>

									</div>
									<br> DNI
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-credit-card"></span>
										<input type="text" class="form-control" name="dni"
											maxlength="8" required>

									</div>
									<br> Correo
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-envelope"></span>
										<input type="email" class="form-control" name="email" required>

									</div>
									<br>

								</div>

								<!-- LADO DERECHO -->

								<div class="col-sm-5">
									Teléfono/Celular
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-phone"></span>
										<input type="text" class="form-control" name="telefono"
											maxlength="9" required>

									</div>
									<br> Usuario
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-eye-open"></span>
										<input type="text" class="form-control" name="usuario"
											required>

									</div>
									<br> Contraseña
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-eye-close">
										</span> <input type="password" class="form-control" name="clave"
											placeholder="***********" required>

									</div>
									<br>
									<div class="input-group">
                                    <span style="font-size: 18px;color: red;">${mensaje}</span>
									</div>
								</div>
						</center>
						</b>

					</div>
					<!-- Container -->
					<center>
						<button type="submit" name="btnregistrar" class="btn btn-info">REGISTRAR</button>
					</center>
					<a href="javascript:window.history.back();">&laquo; Volver
						atrás</a>
				</form>
			</div>
		</div>
	</div>
<br>
	<div class="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>