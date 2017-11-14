package pe.usil.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.service.espec.CondominioServiceEspec;
import pe.usil.condominio.service.espec.InmuebleServiceEspec;

public class Prueba05 {
	
	public static void main(String[] args){
		
		// Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);
	 // Accediendo a un bean
	    CondominioServiceEspec service;
	    service = beanFactory.getBean(CondominioServiceEspec.class);
	    
	 // Proceso
	    
	    List<Map<String,Object>> lista;
	    lista = service.listarRecibos();
	    String result="", res="";
	    
	    
	 // Reporte
	    for (Map<String,Object> r : lista) {
		      System.out.println(r.get("idrecibo") 
			          + " - " + r.get("nombre")
			          + " - " + r.get("codigo")
			          + " - " + r.get("anio")
			          + " - " + r.get("mes")
			          + " - " + r.get("fecVen")
			          + " - " + r.get("importe"));
	    }
	    
	    
	    // Reporte
	    for (Map<String, Object> r : lista) {
			res+="<tr><td>"+r.get("idrecibo")+"</td>"
    		+ "<td>"+r.get("nombre")+"</td>"
    				+ "<td>"+r.get("codigo")+"</td>"
    						+ "<td>"+r.get("anio")+"</td>"
    								+ "<td>"+r.get("mes")+"</td>"
    										+ "<td>"+r.get("fecVen")+"</td>"
    												+ "<td>"+r.get("importe")+"</td></tr>";	
		}
	    result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Recibo</th><th>Nombre</th><th>Codigo</th><th>Año</th>"
			    +"<th>Mes</th><th>Fecha de Vencimiento</th><th>Importe</th></tr></thead><tbody>"+res+"</tbody></table>";
	    
	    System.out.println(result);
	  }
	}


