<%-- 
    Document   : login
    Created on : 01-oct-2017, 12:30:28
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login-Condominio</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>

    <body>

        <div class="wrapper">
            <form class="form-signin">       
                <h2 class="form-signin-heading"><i class="fa fa-building fa-1x  icon-set"></i>Login Condominio</h2><br>
                <input type="text" class="form-control" name="username" placeholder="Usuario" required="" autofocus="" />
                <input type="password" class="form-control" name="password" placeholder="Contraseña" required=""/><br>      
                <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>   
            </form>
        </div>

    </body>
</html>
