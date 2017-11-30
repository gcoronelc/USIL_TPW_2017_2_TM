package pe.usil.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.service.espec.InmuebleServiceEspec;




public class Prueba02 {
	public static void main(String[] args) {
		 // Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);


	    // Accediendo a un bean
	    InmuebleServiceEspec service;
	    service = beanFactory.getBean(InmuebleServiceEspec.class);
	    
	    // Proceso
	    int idpersona = 2;
	    List<Map<String,Object>> lista;
	    lista = service.listarInmuebles(idpersona);
	    
	    // Reporte
	    for (Map<String,Object> r : lista) {
	      System.out.println(r.get("idinmueble") 
	          + " - " + r.get("piso")
	          + " - " + r.get("numero")
	          + " - " + r.get("descripcion")
	          + " - " + r.get("dueno")
	          + " - " + r.get("tinmueble")
	          + " - " + r.get("ntorre"));
	    }
	    
	  }
}
