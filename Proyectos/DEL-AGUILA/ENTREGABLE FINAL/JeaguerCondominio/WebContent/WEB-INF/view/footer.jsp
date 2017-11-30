<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<style type="text/css">
.ih-item {
	position: relative;
	-webkit-transition: all 0.35s ease-in-out;
	-moz-transition: all 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

.ih-item, .ih-item * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.ih-item a {
	color: #333;
}

.ih-item a:hover {
	text-decoration: none;
}

.ih-item img {
	width: 100%;
	height: 100%;
}

.ih-item.circle {
	position: relative;
	width: 120px;
	height: 120px;
	border-radius: 50%;
}

.ih-item.circle .img {
	position: relative;
	width: 120px;
	height: 120px;
	border-radius: 50%;
}

.ih-item.circle .img:before {
	position: absolute;
	display: block;
	content: '';
	width: 100%;
	height: 100%;
	border-radius: 50%;
	box-shadow: inset 0 0 0 16px rgba(255, 255, 255, 0.6), 0 1px 2px
		rgba(0, 0, 0, 0.3);
	-webkit-transition: all 0.35s ease-in-out;
	-moz-transition: all 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

.ih-item.circle .img img {
	border-radius: 50%;
}

.ih-item.circle .info {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	text-align: center;
	border-radius: 50%;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

.ih-item.circle.effect5 {
	-webkit-perspective: 900px;
	-moz-perspective: 900px;
	perspective: 900px;
	margin-left: auto;
	margin-right: auto;
}

.ih-item.circle.effect5.colored .info .info-back {
	background: #1a4a72;
	background: rgba(26, 74, 114, 0.6);
}

.ih-item.circle.effect5 .info {
	-webkit-transition: all 0.35s ease-in-out;
	-moz-transition: all 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	-o-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

.ih-item.circle.effect5 .info .info-back {
	visibility: hidden;
	border-radius: 50%;
	width: 100%;
	height: 100%;
	background: #333333;
	background: rgba(0, 0, 0, 0.6);
	-webkit-transform: rotate3d(0, 1, 0, 180deg);
	-moz-transform: rotate3d(0, 1, 0, 180deg);
	-ms-transform: rotate3d(0, 1, 0, 180deg);
	-o-transform: rotate3d(0, 1, 0, 180deg);
	transform: rotate3d(0, 1, 0, 180deg);
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

.ih-item.circle.effect5 .info h3 {
	color: #fff;
	text-transform: uppercase;
	position: relative;
	letter-spacing: 2px;
	font-size: 8px;
	padding: 50px 0 0 0;
	height: 130px;
	text-shadow: 0 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.3);
}

.ih-item.circle.effect5 .info p {
	color: #bbb;
	padding: 10px 5px;
	font-style: italic;
	margin: 0 30px;
	font-size: 12px;
	border-top: 1px solid rgba(255, 255, 255, 0.5);
}

.ih-item.circle.effect5 a:hover .info {
	-webkit-transform: rotate3d(0, 1, 0, -180deg);
	-moz-transform: rotate3d(0, 1, 0, -180deg);
	-ms-transform: rotate3d(0, 1, 0, -180deg);
	-o-transform: rotate3d(0, 1, 0, -180deg);
	transform: rotate3d(0, 1, 0, -180deg);
}

.ih-item.circle.effect5 a:hover .info .info-back {
	visibility: visible;
}
</style>
</head>
<body>
	<div class="container">
	<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-xs-6 col-md-2 text-center equipa">
				<!-- normal -->
				<div class="ih-item circle colored effect5 text-center">
					<a>
						<div class="img">
							<img src="imagenes/luciola.jpeg" alt="" />
						</div>
						<div class="info">
							<div class="info-back">
								<br>
								<h3>ANALISTA</h3>
							</div>
						</div>
					</a>
				</div>
				<!-- end normal -->
			</div>
			<div class="col-xs-6 col-md-2 text-center">
				<!-- colored -->
				<div class="ih-item circle colored effect5 text-center">
					<a>
						<div class="img">
							<img src="imagenes/sulma.jpg" alt="" />
						</div>
						<div class="info">
							<div class="info-back">
								<br>
								<h3>ANALISTA</h3>
							</div>
						</div>
					</a>
				</div>
				<!-- end colored -->
			</div>
			<div class="col-xs-6 col-md-2 text-center">
				<!-- normal -->
				<div class="ih-item circle colored effect5 text-center">
					<a>
						<div class="img">
							<img src="imagenes/barrios.jpeg" alt="" />
						</div>
						<div class="info">
							<div class="info-back">
								<br>
								<h3>ADMINISTRADOR BD</h3>
							</div>
						</div>
					</a>
				</div>
				<!-- end normal -->
			</div>
			<div class="col-xs-6 col-md-2 text-center">
				<!-- colored -->
				<div class="ih-item circle colored effect5 text-center">
					<a>
						<div class="img">
							<img src="imagenes/casani.png" alt="" />
						</div>
						<div class="info">
							<div class="info-back">
								<br>
								<h3>DISEÑADORA WEB</h3>
							</div>
						</div>
					</a>
				</div>
				<!-- end colored -->
			</div>
			<div class="col-xs-6 col-md-2 text-center">
				<!-- colored -->
				<div class="ih-item circle colored effect5 text-center">
					<a>
						<div class="img">
							<img src="imagenes/foto.jpg" alt="" />
						</div>
						<div class="info">
							<div class="info-back">
								<br>
								<h3>PROGRAMADOR</h3>
							</div>
						</div>
					</a>
				</div>
				<!-- end colored -->
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<br><br>
	<div class="container">
                <div class="col-lg-12 text-center">
                    <span style="text-align: center; color: #fff; margin-left: 80px;">2017 © JEAGUER CONDOMINIO. TODOS LOS DERECHOS RESERVADOS</span>
                </div>
	</div>
</body>
</html>