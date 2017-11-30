package pe.egcc.condominio.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.service.ObligacionManteService;

public class PruebaGenerarCuotaMant {
	public static void main(String[] args) {

		   
	    String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);

	    
	    ObligacionManteService service;
	    service = beanFactory.getBean(ObligacionManteService.class);
	    
	    
	    try {
	      service.generaCuotaMant(2017, 2);
	      System.out.println("Ok");
	    } catch (Exception e) {
	      System.out.println("ERROR: " + e.getMessage());
	    }	           
	  }
}
