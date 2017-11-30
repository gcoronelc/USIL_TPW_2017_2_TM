<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Login-Condominio</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <link rel="stylesheet" type="text/css" 
href='<c:url value="/css/login.css" />'>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="wrapper">
            <form class="form-signin" method="post" action="ingresar.htm">       
                <h2 class="form-signin-heading"><i class="fa fa-building fa-1x  icon-set"></i>Login Condominio</h2><br>
                <input type="text" class="form-control" name="usuario" placeholder="Usuario" required="" autofocus="" />
                <input type="password" class="form-control" name="clave" placeholder="Contraseña" required=""/><br>
                <p> ${error}</p><br>      
                <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>   
            </form>
        </div>
	
</body>
</html>