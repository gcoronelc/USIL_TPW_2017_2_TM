package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.PropietarioService;

public class Prueba06 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		PropietarioService service;
		try {
			service = beanFactory.getBean(PropietarioService.class);
			Propietario bean = new Propietario();
			bean.setUsuario("nuevo");
			bean.setClave("login");
			bean.setEstado(1);
			bean.setIdpro(2);
			service.actualizarLoginPropietario(bean);
			System.out.println("Actualizacion Ok");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
