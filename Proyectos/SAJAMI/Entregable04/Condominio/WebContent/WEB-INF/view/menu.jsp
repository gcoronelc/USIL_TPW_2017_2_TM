<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar navbar-inverse">

        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <p href="#" class="navbar-brand">Condominio</p>
        </div>

        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
            <li><a href="main.htm">Inicio</a></li>
            <c:if test="${usuario.idrol==1}">
	            <li><a href="inmuebles.htm">Mis inmuebles</a></li>
                <li><a href="eventos.htm">Eventos</a></li>
                <li><a href="estadocuenta.htm">Estado de Cuenta</a></li>
                </c:if>
                <c:if test="${usuario.idrol!=1}">
                <li><a href="#">Estado Financiero </a></li>
                <li><a href="recibos.htm">Recibos</a></li>
                <li><a href="personas.htm">Personas</a></li>
                <li><a href="inmueblesadmi.htm">Inmuebles</a></li>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<li><a href="#">Usuario: ${usuario.nombre} </a></li>
                <li><a href="salir.htm">Salir</a></li>
            </ul>
        </div>
    </nav>

