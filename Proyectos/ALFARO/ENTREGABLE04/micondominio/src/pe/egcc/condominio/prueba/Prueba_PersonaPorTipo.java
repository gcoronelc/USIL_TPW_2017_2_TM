package pe.egcc.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.model.PersonaModel;
import pe.egcc.condominio.service.spec.PersonaServiceSpec;

public class Prueba_PersonaPorTipo {

	  public static void main(String[] args) {
		    // Instanciando el contexto
		    String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
		    BeanFactory beanFactory;
		    beanFactory = new ClassPathXmlApplicationContext(contexto);

		    // Accediendo a un bean
		    PersonaServiceSpec service;
		    service = beanFactory.getBean(PersonaServiceSpec.class);
		    
		    // Proceso
		    String tipo = "PROPIETARIO";
		    List<Map<String,Object>> lista;
		    lista = service.leerPersonaTipo(tipo);
		    
		    // Reporte
		    for (Map<String, Object>r: lista) {
		      System.out.println(r.get("idpersona")
		          + " - " + r.get("nombre")
		          + " - " + r.get("apellido")
		          + " - " + r.get("dni")
		          + " - " + r.get("email"));
		    }
	  }
}
