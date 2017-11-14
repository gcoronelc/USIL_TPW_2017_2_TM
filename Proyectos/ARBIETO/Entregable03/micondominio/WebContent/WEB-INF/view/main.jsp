<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<!-- Importar CSS  -->
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap -->
	<title>Inicio</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
        <!-- Page Content -->
            <div class="container-fluid">
               <!-- Carousel Images -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div id="carousel1" class="carousel slide">
                    <ol class="carousel-indicators">
                    <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
                    <li data-target="#carousel1" data-slide-to="1" class=""> </li>
                    <li data-target="#carousel1" data-slide-to="2" class=""> </li>
                    </ol>
                    <div class="carousel-inner">
                    <div class="item active"> <img class="img-responsive" src="images/condominio1.jpg" alt="thumb">
                    <div class="carousel-caption"> Bienvenidos a Condosoft. </div>
                    </div>
                    <div class="item"> <img class="img-responsive" src="images/condominio2.jpg" alt="thumb">
                    <div class="carousel-caption"></div>
                    </div>
                    <div class="item"> <img class="img-responsive" src="images/condominio3.jpg" alt="thumb">
                    <div class="carousel-caption"></div>
                    </div>
                    </div>
                    <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
                </div>
                <!-- END Carousel Images -->
                <!-- Controles -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">   
                <h2 class="text-center">Accesos Directos</h2>
                <hr>
                <div class="row">
                    <div class="col-lg-12">

                    <div class="col-md-6">
                      <div class="profile-card text-center">

                        <img class="img-responsive" src="images/propietario.jpg" width="100%" >
                        <div class="profile-info">

                          <h3 class="hvr-underline-from-center">Propietario<span>Administrar propietario</span></h3>
                          <div>Buscar propietarios existentes y ver información completa sobre ellos, registrar nuevos propietarios, modificar información que posee un propietario en específico como también eliminar existentes.</div>
                        </div>
                            <a type="submit" class="btn btn-warning btn-block btn-lg" id="card-comenzar" href="autor.html">Comenzar</a>
                      </div>
                    </div>

                  
                    <div class="col-md-6">
                      <div class="profile-card text-center">

                        <img class="img-responsive" src="images/inmueble.jpg" width="100%" >
                        <div class="profile-info">

                          <h3 class="hvr-underline-from-center">Inmueble<span>Administrar inmuebles</span></h3>
                          <div>Buscar inmuebles existentes y ver información completa sobre ellos, registrar nuevos inmuebles, modificar información que posee un inmueble en específico como también eliminar inmuebles existentes.</div>
                        </div>
                            <a type="submit" class="btn btn-warning btn-block btn-lg" id="card-comenzar" href="book.html">Comenzar</a>
                      </div>
                    </div>

                  </div>

                </div>
                
                </div>
                <!-- END Controles -->
                
                
                <!-- Profile Cards -->
                <div class="col-lg-12 col-sm-12">
                    <div class="card hovercard">
                        <div class="cardheader">
                            <img alt=""  src="images/sunset.jpg">
                        </div>
                        <div class="avatar">
                            <img alt="" src="images/thatsme.jpg">
                        </div>
                        <div class="info">
                            <div class="title">
                                <a target="_blank" href="#">Jesús Caleb</a>
                            </div>
                            <div class="desc">Programador Front-end</div>
                            <div class="desc">Curioso en informática</div>
                        </div>
                        <div class="bottom">
                            <a class="btn btn-danger btn-sm" rel="publisher"
                               href="https://plus.google.com/u/0/118362674588343663668" title="Sígueme en Google+">
                                <i class="fa fa-google-plus"></i>
                            </a>
                            <a class="btn btn-primary btn-sm" rel="publisher"
                               href="https://www.facebook.com/jesuscaleb.oriabastos" title="Sígueme en Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                            <a class="btn btn-success btn-sm" rel="publisher" href="https://github.com/jesuscaleb" title="Sígueme en GitHub">
                                <i class="fa fa-github"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

                <!-- END Profile Cards -->       
<!-- Importar JS  -->
<script src="js/jquery-1.11.3.min.js"></script> 
<script src="js/jquery.validate.js"></script>
<script src="js/bootstrap.js"></script>		
</body>
</html>