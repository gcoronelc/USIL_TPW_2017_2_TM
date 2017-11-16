<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="recursos.jsp"/>
<div class="menu">

	<ul>

    <!-- Página de inicio -->
		<li><a href="main.htm">INICIO</a></li>

    <!-- Menú Procesos -->
		<li><a href="#">MANTENIMIENTO</a>
			<ul>
				<li><a href="mantInmueble.htm">Inmueble</a></li>
				<li><a href="registroPro.htm">Propietario</a></li>
				<li><a href="#">Alquiler</a></li>
			</ul>
		</li>
			
			
		<li><a href="#">CONSULTA</a>
			<ul>
				<li><a href="#">Inmueble</a></li>
				<li><a href="#">Propietario</a></li>
				<li><a href="#">Alquiler </a></li>
			</ul>
		</li>
		
		<li><a href="#">TRANSACCCIONES</a>
      <ul>
        <li><a href="#">Ingresos</a></li>
        <li><a href="#">Pago de Servicio</a></li>
        <li><a href="#">Pago por Propietario</a></li>
      </ul>
    </li>
    
    <li><a href="#">REPORTES</a>
      <ul>
        <li><a href="#">Ingresos por Alquiler</a></li>
        <li><a href="#">Propietario </a></li>
      </ul>
    </li> 
    
  </ul>
</div>

