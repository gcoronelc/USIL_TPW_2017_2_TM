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

public class Prueba03 {
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
	    
	  }
	    
	  }

