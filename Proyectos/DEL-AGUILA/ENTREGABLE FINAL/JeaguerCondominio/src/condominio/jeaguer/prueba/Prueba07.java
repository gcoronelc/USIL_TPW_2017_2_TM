package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.Torre;
import condominio.jeaguer.service.PropietarioService;
import condominio.jeaguer.service.TorreService;

public class Prueba07 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		TorreService service;
		try {
			service = beanFactory.getBean(TorreService.class);
			Torre bean = new Torre();
			bean.setNombre("Torre Pacifico");
			service.registrarTorre(bean);
			System.out.println("Registro oki");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
