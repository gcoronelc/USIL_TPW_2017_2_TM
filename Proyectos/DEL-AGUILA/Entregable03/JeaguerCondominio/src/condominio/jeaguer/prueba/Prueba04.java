package condominio.jeaguer.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import condominio.jeaguer.model.Inmueble;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.InmuebleService;
import condominio.jeaguer.service.PropietarioService;

public class Prueba04 {

	public static void main(String[] args) {

		// Instanciando el contexto
		String contexto = "/condominio/jeaguer/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);

		InmuebleService service;
		try {
			service = beanFactory.getBean(InmuebleService.class);
			int idpro=2;
			List<Map<String, Object>> lista;
			lista=service.listaInmueblesxPropietario(idpro);
			for (Map<String, Object> i : lista) {
				System.out.println(i.get("piso")
						+"-"+i.get("torre")+"-"+i.get("nombre")+"-"+i.get("numero"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
