package pe.spring.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.service.esp.PersonaServiceSpec;

public class Prueba8 {
	
public static void main(String[] args) {
		
		String contexto="/pe/spring/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory=new ClassPathXmlApplicationContext(contexto);
		
		PersonaServiceSpec service;
		
		//int idtPersona=2;
		String busqueda="salazar";
		
		service=beanFactory.getBean(PersonaServiceSpec.class);
		List<Map<String, Object>>lista;
		lista=service.buscarPersona(busqueda);
		
		for(Map<String,Object>r:lista){
			System.out.println(r.get("tipoNombre"));

		}	
		}

}
