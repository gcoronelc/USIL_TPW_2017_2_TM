<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="/css/login.css" />'>

<title>CondominioApp</title>
</head>
<body>
<form method="post" action="inicio.htm">
<div class="login-body">
    <article class="container-login center-block">
					<h1 align="center">LOGIN</h1>						
						<div class="form-group ">
							<label for="login" class="sr-only">USUARIO</label>
								<input type="text" class="form-control" name="usuario" 
									tabindex="2" value="" />
						</div>
						<div class="form-group ">
							<label for="password" class="sr-only">PASSWORD</label>
								<input type="password" class="form-control" name="password"
									tabindex="2" value=""/>
						</div>
						<br/>
						<div align="center" class="form-group ">				
								<button type="submit" name="log-me-in" id="submit" tabindex="5" class="btn btn-lg btn-primary">
								<a>INGRESAR</a>
								</button>
						</div>
					</form>	
		</section>
	</article>
</div>
</form>	
</body>
</html>