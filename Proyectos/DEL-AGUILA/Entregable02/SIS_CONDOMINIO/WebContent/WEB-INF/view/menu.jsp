<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">&#127968;</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="administrador.php"><b>INICIO</b></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">CONSULTAS<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="correosregistrados.php">PAGOS</a></li>
                            <li><a href="counterregistrado.php">DEUDAS</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">MANTENIMIENTO<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="publicidad_Modal.php">CAMBIO DE DATOS</a></li>
                            <li><a href="listaContactos.php">CAMBIO DE ALQUILER</a></li>
                        </ul>
                    </li>                    
                </ul>

                <!-- LOGIN O INGRESO DEL USUARIO -->
                <ul class="nav navbar-nav navbar-right">
                    <li><p class="navbar-text">Hola --> Usuario</p></li>
                    <li><a href="index.htm">Cerrar Sesion</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
</nav>


</body>
</html>