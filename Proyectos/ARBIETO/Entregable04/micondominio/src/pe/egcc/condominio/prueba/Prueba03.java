package pe.egcc.condominio.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.service.AguaService;
import pe.egcc.condominio.service.CondoService;

public class Prueba03 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		// Acceso a la clase de servicio
		AguaService service;
		service = beanFactory.getBean(AguaService.class);

		// Prueba de la clase de servicio
		try {
			service.creaCuotaAgua(2017, 11, 1);
			System.out.println("Ok");
		} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage());
		}

	}

}
