package condominio.jeaguer.prueba;

import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Inmueble;
import condominio.jeaguer.model.Obligacion;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.Torre;
import condominio.jeaguer.service.AlquilerAudiService;
import condominio.jeaguer.service.CondoService;
import condominio.jeaguer.service.PropietarioService;
import condominio.jeaguer.service.TorreService;

public class Prueba12 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		AlquilerAudiService service;
		try {
			service = beanFactory.getBean(AlquilerAudiService.class);
			List<Propietario> lista = service.listapropie();
			for (Propietario obli : lista) {
				System.out.println(obli.getIdpro()+" - "+ obli.getApellido());
				
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
