<%-- 
    Document   : index
    Created on : 01-oct-2017, 13:19:33
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Eventos</title>
        <jsp:include page="head.jsp"></jsp:include>
        </head>
        <body>
            <!--Menú-->

        <jsp:include page="menu.jsp"></jsp:include>
            <!--Fin del Menú-->


            <div class="container">
                <div class="row main-low-margin ">

                    <div class="col-md-4 col-sm-4">
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <form style="margin-top: 80px; margin-bottom: 80px;">
                            <div class="form-group">
                                <label for="">Fecha de Evento:</label>
                                <input type="date" class="form-control" id="fevento">
                            </div>
                            <div class="form-group">
                                <label for="">Nombre de Evento</label>
                                <input type="text" class="form-control" id="nevento">
                            </div>
                            <div class="form-group">
                                <label for="">Hora de Inicio:</label>
                                <input type="time" class="form-control" id="hinicio">
                            </div>
                            <div class="form-group">
                                <label for="">Hora de Termino:</label>
                                <input type="time" class="form-control" id="hfin">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox"> Pago Limpieza</label>
                            </div>
                            <button type="submit" class="btn btn-success">Reservar</button>
                        </form>
                    </div>
                    <div class="col-md-4 col-sm-4">
                    </div>


                </div>
                <div class="row main-low-margin text-center ">
                    <div class="col-md-3 col-sm-3">
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <i class="fa fa-clock-o fa-5x"></i>
                        <h3>Tiempo</h3>
                        <p class="row main-low-margin">
                            Puedes reservar por un tiempo maximo de 24h, y recuerda que al pedir
                            el servicio de limpieza suma 1h a su tiempo requerido.
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-3 text-center">
                        <i class="fa fa-times-circle-o fa-5x "></i>
                        <h3>Cancelaciones</h3>
                        <p class="row main-low-margin">
                            Si deseas cancelar el evento, se requiere minimo 1 dia de
                            antelacion y se considerara un pago por administracion.
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-3">
                    </div>


                </div>


            </div>
            <div class="space-bottom"></div>


            <div class="content">
            </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
