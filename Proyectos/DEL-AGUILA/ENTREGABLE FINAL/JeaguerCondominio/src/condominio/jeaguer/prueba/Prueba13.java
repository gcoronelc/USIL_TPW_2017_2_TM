package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.AlquilerAuditorio;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.AlquilerAudiService;
import condominio.jeaguer.service.PropietarioService;

public class Prueba13 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		AlquilerAudiService service;
		try {
			service = beanFactory.getBean(AlquilerAudiService.class);
			AlquilerAuditorio bean = new AlquilerAuditorio();
			bean.setIdinmueble(6);
			bean.setIdpro(2);
			bean.setFechainicio("17-12-2017");
			bean.setFechafin("19-12-2017");
			bean.setCosto(980.00);
			bean.setPagado(2);
			bean.setLimpieza(1);
			bean.setCostolimpieza(90.00);
			bean.setTotal(bean.getCosto()+bean.getCostolimpieza());
			service.registrarAlquiler(bean);
			System.out.println("Registro oki");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
