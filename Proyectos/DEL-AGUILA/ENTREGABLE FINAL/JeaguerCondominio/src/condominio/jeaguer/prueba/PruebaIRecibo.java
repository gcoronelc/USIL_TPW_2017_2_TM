package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Recibo;
import condominio.jeaguer.service.ReciboService;

public class PruebaIRecibo {
	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		ReciboService service;
		service = beanFactory.getBean(ReciboService.class);
		
		try {
			service = beanFactory.getBean(ReciboService.class);
			Recibo bean = new Recibo();
			bean.setIdtobligacion(3);
			bean.setCodigo("Pintado General de Condominio");
			bean.setAnio(2017);
			bean.setMes(12);
			bean.setFecVen("2017-12-15");
			bean.setImporte(2000.0);
			service.registrarRecibo(bean);
			System.out.println("registro ok");
		} catch (Exception e) {
			System.err.println(e.getMessage());
			System.out.println("vamos una mas");
		}
	}
}
