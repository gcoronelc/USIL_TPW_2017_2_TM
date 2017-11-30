<div class="">
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.htm">Proyecto Condominio</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Inicio</a></li>
      <li><a href="nuestroEquipo.htm">Nuestro equipo</a></li>
      <li><a href="#">Galeria</a></li> 
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Departamentos
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Departamentos A</a></li>
          <li><a href="#">Departamentos B</a></li>
          <li><a href="#">Departamentos C</a></li>
        </ul>
      </li>
      <li><a href="#">Contacto</a></li> 
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" id="SignUp_Modal" data-toggle="modal" data-target="#myModal"><span> <img src="iconos/glyphicons/figura-de-usuario.png" />
      </span> Acceder al sistema</a></li>    
    </ul>
    <div >
      	<div id="myModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">

   		 <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" style="text-align: center;"> Ingresar al sistema</h4>
	      	</div>
	      	<div class="modal-body" style="display: inline-block; margin-left: 30%;">
	        	<form action="ingresar.htm" method="post" >
		        	<div class="row">
		        	<div class="col-md-12">
		        		<label id="lbl_usuarioSU" class="centra"><b>Usuario</b></label><br>  
				      	<input type="text" placeholder="Nombre de usuario" name="usuario" required>
		        	</div>
		        	</div>
		        	<div class="row">
		        	<div class="col-md-12">
		        		<label id="lbl_contraseñaSU" class="centra"><b>Contraseña</b></label><br> 
				        <input type="password" placeholder="Nombre de contraseña" name="clave" required>
		        	</div>
		        	</div><br>
		        	<p>
		        	<input type="submit" value="Ingresar"  class="btn btn-default centra"  name="btn_entrarSU" >
		        	</p>
	        	</form> 
	        	<p>Error: ${error}</p>  	
	      	</div>
	      </div>
  		</div>
		</div>
   </div>
    
    
  </div>
</nav>
</div>