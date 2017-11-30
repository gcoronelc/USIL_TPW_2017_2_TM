package condominio.jeaguer.prueba;

import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.PropietarioService;

public class Prueba03 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		PropietarioService service;
		try {
			service = beanFactory.getBean(PropietarioService.class);
			List<Propietario> lista = service.listaPropietarios();
			for (Propietario propietario : lista) {
				System.out.println(propietario.getApellido());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
