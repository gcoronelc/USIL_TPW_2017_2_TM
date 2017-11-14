<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>CONDOMINIOS SOFT</title>
<jsp:include page="recursos.jsp"/>
</head>
<body>

        <!--Menú-->
        
        <jsp:include page="menu.jsp"></jsp:include>
        <!--Fin del Menú-->
	
	 <div class="container">
        <div class="row main-low-margin text-center">
            <div class="col-md-8 col-md-offset-2">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="<c:url value="/img/modal-1.jpg" />" alt="Los Angeles">
    </div>

    <div class="item">
      <img src="<c:url value="/img/modal-2.jpg" />" alt="Chicago">
    </div>

    <div class="item">
      <img src="<c:url value="/img/modal-3.jpg" />" alt="New York">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
            </div>
         

        </div>
        <div class="row main-low-margin ">
            <div class="col-md-3 col-sm-3 text-center">
                <i class="fa fa-desktop fa-5x"></i>
                <h3>TESTED DESIGN</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                </p>
            </div>
            <div class="col-md-3 col-sm-3 text-center">
                <i class="fa fa-comments-o fa-5x "></i>
                <h3>READY TO USE</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                </p>
            </div>
            <div class="col-md-6 col-sm-6">
                <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                </p>

            </div>

        </div>


    </div>
    <div class="space-bottom"></div>

        
<div class="content">
</div>
        
        <jsp:include page="pie.jsp"></jsp:include>
	
</body>
</html>