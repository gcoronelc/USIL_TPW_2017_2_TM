package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.PropietarioService;

public class Prueba02 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		PropietarioService service;
		try {
			service = beanFactory.getBean(PropietarioService.class);
			Propietario bean = new Propietario();
			bean.setApellido("Coronel");
			bean.setNombre("Propietario");
			bean.setDni("98261738");
			bean.setEmail("micorreo@gmail.com");
			bean.setTelefono("987654321");
			bean.setUsuario("nuevo");
			bean.setClave("login");
			bean.setEstado(1);
			service.registrarPropietario(bean);
			System.out.println("Registro oki");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
