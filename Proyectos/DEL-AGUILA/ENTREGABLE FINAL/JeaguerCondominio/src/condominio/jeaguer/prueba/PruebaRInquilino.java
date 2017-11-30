package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Inquilino;
import condominio.jeaguer.service.InquilinoService;

public class PruebaRInquilino {
	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		InquilinoService service;
		try {
			service = beanFactory.getBean(InquilinoService.class);
			Inquilino bean = new Inquilino();
			bean.setIdinmueble(17);
			bean.setApellido("Coronel");
			bean.setNombre("Gustavo");
			bean.setDni("56261738");
			bean.setEmail("cgustavo@gmail.com");
			bean.setTelefono("987654321");
			bean.setEstado(1);
			service.registrarInquilino(bean);
			System.out.println("Registro OK!");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
