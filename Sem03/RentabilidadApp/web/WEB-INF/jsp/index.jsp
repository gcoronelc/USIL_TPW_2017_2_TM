<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>RENTABILIDAD</title>
  </head>

  <body>
    <h1>MI CURSO ES RENTABLE</h1>
    
    <form method="post" action="renta.egcc" >
      
      <fieldset>
        <legend>INPUT</legend>
        
        <table>
          
          <tr>
            <td>Curso:</td>
            <td><input type="text" name="curso" /></td>
          </tr>
          
          <tr>
            <td>Precio:</td>
            <td><input type="text" name="precio" /></td>
          </tr>
          
          <tr>
            <td>Horas:</td>
            <td><input type="text" name="horas" /></td>
          </tr>
          
          <tr>
            <td>Alumnos:</td>
            <td><input type="text" name="cantAlu" /></td>
          </tr>
          
          <tr>
            <td>Pago por Hora</td>
            <td><input type="text" name="pagoHora" /></td>
          </tr>
          
          <tr>
            <td colspan="2">
              <input type="submit" value="Procesar" />
            </td>
          </tr>
          
        </table>
      </fieldset>
      
    </form>
    
    <div>
      <h1>RESPUESTA</h1>
      <table>
        
        <tr>
          <td>INGRESOS:</td>
          <td>${bean.ingresos}</td>
        </tr>
        
        <tr>
          <td>GASTOS:</td>
          <td>${bean.gastos}</td>
        </tr>
        
        <tr>
          <td>RENTABILIDAD:</td>
          <td>${bean.renta}</td>
        </tr>
        
      </table>
    </div>
  </body>
</html>
