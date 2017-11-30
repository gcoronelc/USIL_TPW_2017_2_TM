package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Inmueble;
import condominio.jeaguer.service.InmuebleService;

public class PruebaAInmueble {
	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		InmuebleService service;
		service = beanFactory.getBean(InmuebleService.class);
		
		try {
			service = beanFactory.getBean(InmuebleService.class);
			Inmueble bean = new Inmueble();
			bean.setPiso(5);
			bean.setNumero(504);
			bean.setDescripcion("Departamento de Julio");
			bean.setIdpro(1);
			bean.setIdtinmueble(1);
			bean.setIdtorre(1);
			bean.setActivo(1);
			bean.setIdinmueble(18);
			service.registrarInmueble(bean);
			System.out.println("editado ok");
		} catch (Exception e) {
			System.err.println(e.getMessage());
			System.out.println("vamos una mas");
		}
	}
}
