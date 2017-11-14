<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>
<title>JEAGUER CONDOMINIO</title>

<style type="text/css">
@import
	url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css")
	;

.login-block {
	background: #DE6262; /* fallback for old browsers */
	background: -webkit-linear-gradient(to bottom, #5A9CDE, #1078E0);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to bottom, #BFC9CA, #5D6D7E  );
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	float: left;
	width: 100%;
	padding: 50px 0;
}

.banner-sec {
	background: ;
	background-size: cover;
	min-height: 500px;
	border-radius: 0 10px 10px 0;
	padding: 0;
}

.container {
	background: #fff;
	border-radius: 10px;
	box-shadow: 15px 20px 0px rgba(0, 0, 0, 0.1);
}

.carousel-inner {
	border-radius: 0 10px 10px 0;
}

.carousel-caption {
	text-align: left;
	left: 5%;
}

.login-sec {
	padding: 50px 30px;
	position: relative;
}

.login-sec .copy-text {
	position: absolute;
	width: 80%;
	bottom: 20px;
	font-size: 13px;
	text-align: center;
}

.login-sec .copy-text i {
	color: #FEB58A;
}

.login-sec .copy-text a {
	color: #E36262;
}

.login-sec h2 {
	margin-bottom: 30px;
	font-weight: 800;
	font-size: 30px;
	color: #DE6262;
}

.login-sec h2:after {
	content: " ";
	width: 100px;
	height: 5px;
	background: #FEB58A;
	display: block;
	margin-top: 20px;
	border-radius: 3px;
	margin-left: auto;
	margin-right: auto
}

.btn-login {
	background: #10D7E0;
	color: #fff;
	font-weight: 600;
}

.banner-text {
	width: 70%;
	position: absolute;
	bottom: 40px;
	padding-left: 20px;
	background-color: #fff;
}

.banner-text h2 {
	color: #CB4335;
	font-weight: 600;
}

.banner-text h2:after {
	content: " ";
	width: 100px;
	height: 5px;
	background: #CB4335;
	display: block;
	margin-top: 20px;
	border-radius: 3px;
}

.banner-text p {
	color: #CB4335;
}
</style>




</head>
<body>
	<section class="login-block">
	<div class="container">
		<div class="row">
			<div class="col-md-4 login-sec">
				<h2 class="text-center">Login</h2>
				<form class="login-form" method="post" action="ingresar.htm">
					<div class="form-group">
						<label for="exampleInputEmail1" class="text-uppercase">Usuario</label>
						<input type="text" name="usuario" class="form-control"
							placeholder="" required >

					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="text-uppercase">Contraseña</label>
						<input type="password" name="clave" class="form-control"
							placeholder="" required>
					</div>


					<div class="form-check">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input"> <small>Recordar</small>
						</label>
						<button type="submit" class="btn btn-login float-right">Ingresar</button>
					</div>
					<div>
					<h3><span style="color:red;">${error}</span></h3>
					</div>

				</form>
			</div>
			<div class="col-md-8 banner-sec">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="imagenes/im1.jpg" width="900px"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<!--  <div class="banner-text">
									<h2>This is Heaven</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
								</div> -->
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="imagenes/im2.jpg" width="900px"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<!-- <div class="banner-text">
									 <h2>This is Heaven</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
								</div>-->
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="imagenes/im3.jpg" width="900px"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<!--  <div class="banner-text">
									<h2>This is Heaven</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
								</div>-->
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



</body>
</html>