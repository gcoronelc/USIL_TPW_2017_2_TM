<div class="container">
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.htm">Proyecto Condominio</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Procesos</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Consultas
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="Consultas.htm">Personas</a></li>
          <li><a href="listarPropietario.htm">Propietarios</a></li>
          <li><a href="listarImporte.htm">Importe</a></li>
        </ul>
      </li>
      <li><a href="">Consultas</a></li> 
      <li><a href="#">Seguridad</a></li> 
      <li><a href="#">Utilidades</a></li> 
    </ul>  
       <div class="btn-group btnMicuenta">
  		<button type="button" class="btn btn-default dropdown-toggle"
          data-toggle="dropdown">
   		 <span><img src="iconos/glyphicons/glyphicons-4-user.png" /></span>${usuario.nombre} ${usuario.apellido} <span class="caret"></span>
  		</button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="#">Mi cuenta</a></li>
		    <li><a href="#">Configuración</a></li>
		    <li><a href="#">Cambiar contraseña</a></li>
		    <li class="divider"></li>
		    <li><a href="salir.htm">Cerrar Sesión</a></li>
		  </ul>
	  </div> 
  </div>
</nav>
</div>