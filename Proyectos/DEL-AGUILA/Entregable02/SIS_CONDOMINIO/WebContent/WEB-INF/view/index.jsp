<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="/css/login.css" />'>

<title>Condominio</title>
</head>
<body>
<div class="login-body">
    <article class="container-login center-block">
		<section>
			<div class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
				<div id="login-access" class="tab-pane fade active in">
					<h2><i class="glyphicon glyphicon-log-in"></i> Accesso</h2>						
					<form method="post" accept-charset="utf-8" autocomplete="off" role="form" class="form-horizontal">
						<div class="form-group ">
							<label for="login" class="sr-only">Usuario</label>
								<input type="text" class="form-control" name="login" id="login_value" 
									placeholder="Usuario" tabindex="1" value="" />
						</div>
						<div class="form-group ">
							<label for="password" class="sr-only">Clave</label>
								<input type="password" class="form-control" name="password" id="password"
									placeholder="Clave" value="" tabindex="2" />
						</div>
						<br/>
						<div class="form-group ">				
								<button type="submit" name="log-me-in" id="submit" tabindex="5" class="btn btn-lg btn-primary">
								<a href="interfazpro.htm">Entrar</a>
								</button>
						</div>
					</form>			
				</div>
			</div>
		</section>
	</article>
</div>
</body>
</html>