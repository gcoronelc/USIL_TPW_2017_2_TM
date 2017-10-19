<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

	<div id="LOGON">
	
	<h1>INICIO DE SESION</h1>
	<img src='<c:url value="/img/logo2.jpg" />' />

	<p>Error: ${error}</p>
	
	<form method="post" action="ingresar.htm">
	
		<label>Usuario: </label>
		<input type="text" name="usuario" /><br/>
		
		<label>Clave: </label>
		<input type="password" name="clave" /><br/>
	
		<input type="submit" value="Ingresar" />
		
	</form>

	</div>
	
</body>
</html>