<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">

<style type="text/css">
body {
	font-family: "Open Sans", sans-serif;
	font-size: 13px;
	font-style: normal;
	font-weight: normal;
	line-height: 22px;
	white-space: normal;
}

#header-site {
	background: #262727 none repeat scroll 0 0;
	border-bottom: 2px solid #cf4137;
	float: left;
	position: fixed;
	top: 0;
	width: 100%;
}

.logo-site {
	float: left;
	height: 50px;
	margin: 5px 0 0px 10px;
	width: 140px;
}

.logo-site h1 {
	margin: 0;
}

.logo-site h1 a {
	float: left;
	height: 40px;
	width: 80px;
	text-indent: -999px;
	background-image:
		url('imagenes/logon.jpg');
	background-repeat: no-repeat;
	background-position: 0px;
	background-size: 100px;
}

/*Notification Bell dropdown*/
.top-nav {
	padding: 0 5px;
}

.top-nav>li {
	display: inline-block;
	float: left;
}

.top-nav>li>a {
	color: #fff;
	font-size: 13px;
	line-height: 20px;
	padding-bottom: 12px;
	padding-top: 12px;
}

.top-nav>li span.badge {
	background: #ca3f02 none repeat scroll 0 0;
	border: 3px solid #262727;
	font-family: "Open Sans", sans-serif;
	font-size: 11px;
	font-weight: 300;
	padding: 2px 5px;
	position: absolute;
	right: 3px;
	top: 3px;
}

.dropdown-notification .dropdown-menu {
	width: 275px;
	max-width: 275px;
	min-width: 160px;
}

.dropdown-notification>a {
	font-size: 18px !important;
	line-height: 29px !important;
}

.top-nav .dropdown-menu .dropdown-menu-list {
	list-style: outside none none;
	padding-left: 0;
	padding-right: 0 !important;
}

.top-nav>li.dropdown-notification .dropdown-menu>li.external {
	border-radius: 4px 4px 0 0;
	display: block;
	letter-spacing: 0.5px;
	overflow: hidden;
	padding: 15px;
}

.top-nav>li.dropdown-notification .dropdown-menu>li.external>h3 {
	display: inline-block;
	float: left;
	font-size: 13px;
	margin: 0;
	padding: 0;
}

.top-nav>li.dropdown-notification .dropdown-menu>li.external>a {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: 0 none;
	color: #888;
	clear: inherit;
	display: inline-block;
	font-size: 13px;
	font-weight: 300;
	margin-top: -1px;
	padding: 0;
	position: absolute;
	right: 10px;
}

.top-nav>li.dropdown-notification .dropdown-menu>li.external {
	background: #eaedf2 none repeat scroll 0 0;
}

.top-nav>li.dropdown-notification .dropdown-menu .dropdown-menu-list {
	list-style: outside none none;
}

.top-nav>li.dropdown-notification .dropdown-menu .dropdown-menu-list>li>a
	{
	clear: both;
	display: block;
	font-size: 13px;
	font-weight: 300;
	line-height: 20px;
	padding: 16px 15px 18px;
	text-shadow: none;
	white-space: normal;
	border-bottom: 1px solid #eff2f6 !important;
}

.top-nav>li.dropdown-notification .dropdown-menu .dropdown-menu-list>li a .time
	{
	float: right;
	font-size: 11px;
	font-weight: 400;
	max-width: 75px;
	opacity: 0.7;
	padding: 1px 5px;
	text-align: right;
	background: #f1f1f1 none repeat scroll 0 0;
}

.top-nav>li.dropdown-notification .dropdown-menu .dropdown-menu-list>li a .details
	{
	font-size: 13px;
}

.top-nav>li.dropdown-notification .dropdown-menu .dropdown-menu-list>li a .details .label-icon
	{
	border-radius: 50%;
	margin-right: 10px;
}

.top-nav>li>a:hover, .top-nav>li>a:focus, .top-nav>.open>a, .top-nav>.open>a:hover,
	.top-nav>.open>a:focus {
	background-color: #171717;
	color: #999999;
}

.top-nav>li.dropdown-notification .dropdown-menu .dropdown-menu-list>li>a:hover
	{
	background: #f8f9fa none repeat scroll 0 0;
}

.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover
	{
	background-color: transparent;
	color: #ca3f02;
}

/*Toggle Navigation design*/
.navbar-default .navbar-toggle {
	border: none;
}

.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus
	{
	background: none;
}

@media ( max-width :768px) {
	.navbar-collapse {
		clear: both;
	}
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="navbar navbar-default navbar-fixed-top">
				<header id="header-site">

				<div class="logo-site">
					<h1>
						<a href="administrador.htm">Leistung</a>
					</h1>
				</div>

				<!--Begin::Mobile View Navigation-->
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--End::Mobile View Navigation--> <!--Begin::Header right-->
				<ul class="nav navbar-right pull-right top-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" aria-expanded="true"> <img alt=""
							class="img-circle"
							src="imagenes/admin.jpg"
							width="30"> <span class="hidden-xs">${usuario.nombre}
								- ${usuario.apellido}</span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Edit
									Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-cog"></i> Change
									Password</a></li>
							<li class="divider"></li>
							<li><a href="cerrar.htm"><i
									class="fa fa-fw fa-power-off"></i>Cerrar Sesion</a></li>
						</ul></li>
				</ul>
				<!--End::Header Right--> <!--Begin::Nav-->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left">
						<li><a id="home" href="administrador.htm">INICIO</a></li>
												<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true">REGISTROS
						</a>
							<ul class="dropdown-menu">
								<li><a href="registropro.htm"> Propietarios</a></li>
								<li><a href="nuevatorre.htm"> Nueva Torre</a></li>
								<li><a href="#"> Consulta 3</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true">CONSULTAS 
						</a>
							<ul class="dropdown-menu">
								<li><a href="listapropietarios.htm"> Propietarios</a></li>
								<li><a href="vertorres.htm"> Torre</a></li>
								<li><a href="#"> Consulta 3</a></li>
							</ul></li>
					</ul>
				</div>
				<!--End::Nav--> </header>
			</div>
		</div>
	</div>
</body>
</html>