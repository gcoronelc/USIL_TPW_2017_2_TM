<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href='<c:url value="/images/favicon.ico"></c:url>' type="image/x-icon">
       <link rel="icon" href="images/favicon.ico" type="image/x-icon">
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
     <link rel="stylesheet" href="css/bootstrap.css">
     <link  rel="stylesheet"   href="css/login.css"/>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>INICIO DE SESION</title>
<style type="text/css">

	#LOGON{
		width: 300px;
		margin: 10px auto;
	}

</style>
</head>
<body>
<div align="center">
			<img src="images/Condosoft.svg" alt="">
		</div>
	<p>Error: ${error}</p>
	
	<div id="container" class="row col-md-8 col-md-offset-2 registeration">
	    
	<div class="registerInner">

	        <div class ="col-md-12">
	            <h3 class="headerSign">Iniciar Sesión</h3>
	            <form action="ingresar.htm" id="frm_login" method="post">
	                <p>Error: ${error}</p>
	                <div class="form-group">                    
	                    <input class="form-control" type="text" name="usuario" placeholder="Usuario">
	                </div>
	                
	                <div class="form-group">
	                    <input class="form-control" type="password" name="clave" placeholder="Contraseña" value="">
	                </div>

	                <button id="btn_acceder" type="submit" class="signbuttons btn btn-primary">Acceder</button>
	  
	            </form>

	            
	        </div>
	             
	</div>
	        
	</div>

	</div>
	
		    <!-- Importar Jquery & Bootstrap JS -->
	    <script src="js/jquery-1.11.3.min.js"></script> 
	    <script src="js/jquery.validate.js"></script>
	    <script src="js/bootstrap.js""></script>		
	    <script src="js/sweetalert2.min.js"></script>
	    <!-- FIN Importar JQuery & Bootstrap JS -->
	    <script src="js/index.js"></script>
</body>
</html>