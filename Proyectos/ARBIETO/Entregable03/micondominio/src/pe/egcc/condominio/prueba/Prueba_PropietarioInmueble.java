package pe.egcc.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.service.spec.PersonaServiceSpec;


public class Prueba_PropietarioInmueble {
	
	public static void main(String[] args) {
		    // Instanciando el contexto
		    String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
		    BeanFactory beanFactory;
		    beanFactory = new ClassPathXmlApplicationContext(contexto);

		    // Accediendo a un bean
		    PersonaServiceSpec service;
		    service = beanFactory.getBean(PersonaServiceSpec.class);
		    
		    // Proceso
		    String PROPIETARIO = "COR";
		    String DNI="89435678";
		    List<Map<String,Object>> lista;
		    lista = service.leerPersonas( DNI,PROPIETARIO);
		    
		    // Reporte  
		    for (Map<String, Object>r: lista) {
		      System.out.println(r.get("CODIGO")
		          + " - " + r.get("PROPIETARIO")
		          + " - " + r.get("DNI")
		          + " - " + r.get("ESTADO")
		          + " - " + r.get("CANTIDAD_INMUEBLE"));
		    }
	}
}
