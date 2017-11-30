package pe.usil.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.model.DetInmueble;
import pe.usil.condominio.model.Persona;
import pe.usil.condominio.service.espec.InmuebleServiceEspec;
import pe.usil.condominio.service.impl.InmuebleService;
import pe.usil.condominio.service.impl.PersonaService;

public class Prueba04 {
	public static void main(String[] args) {

	    // Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);
	 // Accediendo a un bean
	    InmuebleServiceEspec service;
	    service = beanFactory.getBean(InmuebleServiceEspec.class);
	    
	    // Proceso
	    int idinmueble = 2;
	    List<Map<String,Object>> lista;
	    lista = service.listarDetInmuebles(idinmueble);
	    String result="";
	    
	    
	 // Reporte
	    for (Map<String,Object> r : lista) {
		      System.out.println(r.get("idobligacion") 
			          + " - " + r.get("idtobligacion")
			          + " - " + r.get("idinmueble")
			          + " - " + r.get("descripcion")
			          + " - " + r.get("anio")
			          + " - " + r.get("mes")
			          + " - " + r.get("importe"));
	    }
	    
	    
	    // Reporte
	    for (Map<String,Object> r : lista) {
	    result+="<tr><td>"+r.get("idobligacion")+"</td>"
	    		+ "<td>"+r.get("idtobligacion")+"</td>"
	    				+ "<td>"+r.get("idinmueble")+"</td>"
	    						+ "<td>"+r.get("descripcion")+"</td>"
	    								+ "<td>"+r.get("anio")+"</td>"
	    										+ "<td>"+r.get("mes")+"</td>"
	    												+ "<td>"+r.get("importe")+"</td></tr>";	
	    
	    }
	    String res="<table><thead><tr><th>Id Inmueble</th><th>Piso</th><th>Numero</th><th>Descripcion</th>"
	    +"<th>Dueño</th><th>Tipo de inmueble</th><th>Torre</th></tr></thead><tbody>"+result+"</tbody></table>";
	    System.out.println(res);
	  }
	    
	  }