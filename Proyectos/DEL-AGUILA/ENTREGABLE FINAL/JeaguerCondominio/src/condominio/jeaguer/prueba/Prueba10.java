package condominio.jeaguer.prueba;

import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Obligacion;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.Torre;
import condominio.jeaguer.service.CondoService;
import condominio.jeaguer.service.PropietarioService;
import condominio.jeaguer.service.TorreService;

public class Prueba10 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		CondoService service;
		try {
			service = beanFactory.getBean(CondoService.class);
			List<Obligacion> lista = service.leerObligaciones(2017, 2, 2);
			for (Obligacion obli : lista) {
				System.out.println(obli.getDescripcion()+"-"+obli.getNomobligacion());
				
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
