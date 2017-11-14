
<nav class="navbar navbar-default navbar-static">
    <div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">

		</button>
		<a href=""><img src="images/Condosoft.svg" alt="Condosoft" width="170" height="40" class="img-responsive"></a>
	</div>
   
    <div id="navbar-collapse" class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-right">
       <ul class="nav navbar-nav">
           <li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mantenimiento <span class="caret"></span></a>				
			  <ul class="dropdown-menu" role="menu">
                <li><a href="propietario.htm">Propietarios</a></li>
                <li><a href="cliente.jsp">Clientes</a></li>
                <li><a href="inmueble.jsp">Inmuebles</a></li>
                <li><a href="#">Visitas</a></li>
                <li><a href="#">Eventos</a></li>
                <li><a href="edificio.jsp">Edificios</a></li>
              </ul>                
            </li>
            <li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Consultas <span class="caret"></span></a>				
			  <ul class="dropdown-menu" role="menu">
                <li><a href="#">Ingresos</a></li>
                <li><a href="#">Gastos</a></li>
                <li><a href="#">Quejas</a></li>
                <li><a href="personaTipo.htm">Propietarios</a></li>
                <li><a href="resumen.htm">Inmuebles</a></li>
              </ul>                
            </li>
            <li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Movimientos <span class="caret"></span></a>				
			  <ul class="dropdown-menu" role="menu">
                <li><a href="#">Ingresos</a></li>
                <li><a href="#">Gastos</a></li>
              </ul>                
            </li>

            <li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reportes <span class="caret"></span></a>				
			  <ul class="dropdown-menu" role="menu">
                <li><a href="#">Cuenta de inmueble</a></li>
                <li><a href="#">Cuenta de propietario</a></li>
                <li><a href="#">Historial de ingresos</a></li>
                <li><a href="#">Historial de gastos</a></li>
                <li><a href="#">Estado financiero</a></li>
              </ul>                
            </li>
		</ul>
        <li class="dropdown">
            <a id="user-profile" href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/user.jpg" class="img-responsive img-thumbnail img-circle"> ${usuario.nombre}-${usuario.apellido}</a>
            <ul class="dropdown-menu dropdown-block" role="menu">
                <li><a href="salir.htm">Cerrar Sesión</a></li>
            </ul>
        </li>
    </ul>
</div>
</nav>