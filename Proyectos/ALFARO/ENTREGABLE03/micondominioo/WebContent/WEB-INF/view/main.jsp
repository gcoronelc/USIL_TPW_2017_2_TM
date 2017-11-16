<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="recursos.jsp"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INICIO</title>

</head>
<body>
	  <div class="egcc_pagina">
  
    <div class="egcc_cabecera">
      <jsp:include page="cabecera.jsp"/>
    </div>
    
    <div class="egcc_menu">
      <jsp:include page="menu.jsp"/>
    </div>
    
    <div class="egcc_contenido">
      <div style="text-align: center;">
        <img src='<c:url value="images/portada.jpg" />' />
      </div>
    </div>
  
    <div class="egcc_pie">
      <jsp:include page="pie.jsp"/>
    </div>
  
  </div>
</body>
</html>
