package condominio.jeaguer.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.service.ReciboService;

public class PruebaLAMRecibo {
	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		ReciboService service;
		try {
			service = beanFactory.getBean(ReciboService.class);
			int anio=2017;
			int mes=11;
			List<Map<String, Object>> lista;
			lista=service.listarReciboxAnioxMes(anio, mes);
			for (Map<String, Object> i : lista) {
				System.out.println(i.get("tipo")
						+"-"+i.get("codigo")+"-"+i.get("anio")+"-"+i.get("mes"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}
}
