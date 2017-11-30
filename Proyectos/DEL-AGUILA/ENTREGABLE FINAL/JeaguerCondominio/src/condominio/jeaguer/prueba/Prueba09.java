package condominio.jeaguer.prueba;

import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.Torre;
import condominio.jeaguer.service.CondoService;
import condominio.jeaguer.service.PropietarioService;
import condominio.jeaguer.service.TorreService;

public class Prueba09 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

	    // Acceso a la clase de servicio
	    CondoService service;
	    service = beanFactory.getBean(CondoService.class);
	    
	    // Prueba de la clase de servicio
	    try {
	      service.creaCuotaMant(2017, 2, 2);  
	      System.out.println("Ok");
	    } catch (Exception e) {
	      System.out.println("ERROR: " + e.getMessage());
	    }

	}

}
