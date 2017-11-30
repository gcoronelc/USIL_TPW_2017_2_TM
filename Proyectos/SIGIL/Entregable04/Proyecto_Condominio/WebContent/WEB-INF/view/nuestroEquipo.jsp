<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Protyecto condominio</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/bootstrap.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/Miestilo.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/font-awesome.css"/>'>
<script type="text/javascript" src='<c:url value="/js/jquery.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.js"/>'></script>
</head>
	<body>
<div class="container" id="cabecera">
	<div>
	<jsp:include page="cabezeraIndex.jsp"></jsp:include>
	</div>
	<div>
		<h3><strong>Nuestro Equipo</strong></h3>
		<p id="descNosotros">Somos un condominio que tiene más de 5 años de construido, nos ubicamos  en una zona muy centrica, a 
		continuación presentamos a los representantes del condomio. </p>
		
		<br>
		<div class="row" id="panelEquipo">
			<div class="col-sm-4 col-md-4" >
				<div id="panel01">
				<img alt="foto_betzy" src="img/julio.jpg" class="foto_betzy" id="foto_betzy1">
					<h6><strong>Sigil Vilca Julio Cesar </strong></h6>
					<h5>Gerente General</h5>
				</div>
			</div>
			<div class="col-sm-4 col-md-4" >
			<div id="panel3">
				<img alt="foto_betzy" src="img/Gisell.jpg" class="foto_betzy" id="foto_betzy2">
					<h6><strong>Romero Sanchez, Gisell Madeleine</strong></h6>
					<h5>Jefa de Recepción</h5>
			</div>
			</div>
			<div class="col-sm-4 col-md-4" >
			<div id="panel02">
				<img alt="foto_betzy" src="img/betzy.jpg" class="foto_betzy" id="foto_betzy3">
					<h6><strong>Condor Villanueva Betzy Cathleen </strong></h6>
					<h5>Sub Gerente</h5>
			</div>
			</div>
		  </div><br>
		<div class="row" id="panelEquipo2">
			<div class="col-sm-6">
			<div id="equipo_izquierda">
					<img alt="foto_milla" src="img/milla.jpg" class="foto_betzy">
					<h6><strong>Milla Villanueva Sthepany Liset </strong></h6>
					<h5>Jefa de Limpieza</h5>
			</div>
			</div>
			<div class="col-sm-6">
			<div id="equipo_derecha">
					<img alt="foto_betzy" src="img/betzy.jpg" class="foto_betzy">
					<h6><strong>Diaz Pacaya Brigit</strong></h6>
					<h5>Jefa de Soporte</h5>
			</div>
			</div>
		</div>
	</div><br>		
	<div id="pie_pagina">
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
</div>
</body>
</html>