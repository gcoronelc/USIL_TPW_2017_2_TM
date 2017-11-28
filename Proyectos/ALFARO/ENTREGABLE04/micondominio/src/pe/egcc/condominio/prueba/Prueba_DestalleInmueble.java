package pe.egcc.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.service.spec.PersonaServiceSpec;

public class Prueba_DestalleInmueble {
	
	public static void main(String[] args) {

		 // Instanciando el contexto
	    String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);

	    // Accediendo a un bean
	    PersonaServiceSpec service;
	    service = beanFactory.getBean(PersonaServiceSpec.class);
	   
	    
	    // Proceso
	    String nomTorre = " ";
	    Integer codPersona=2;
	    List<Map<String,Object>> lista;
	    lista = service.leerDetalleInmueble(nomTorre, codPersona);
	    
	    // Reporte  
	    for (Map<String,Object> r : lista) {
		       System.out.println(r.get("nomTipoInmueble") 
		           + " - " + r.get("piso")
		           + " - " + r.get("numero")
		           + " - " + r.get("descripcion"));
		     }
	}
}
