package pe.usil.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.service.espec.InmuebleServiceEspec;
import pe.usil.condominio.service.espec.PersonaServiceEspec;
import pe.usil.condominio.service.impl.PersonaService;

public class Prueba09 {

	public static void main(String[] args) {
		 // Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);


	    // Accediendo a un bean
	    PersonaServiceEspec service= new PersonaService();
	    service = beanFactory.getBean(PersonaServiceEspec.class);
	   
	    // Proceso
	    int id = 2;
	    try {
	    	service.eliminarPersona(id);
	    	System.out.println("La persona a sido eliminada");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error. "+e.getMessage());
		}
	    
	  }
	
}
