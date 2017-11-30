package pe.spring.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.service.esp.PersonaServiceSpec;

public class Prueba6 {
	
public static void main(String[] args) {
		
		String contexto="/pe/spring/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory=new ClassPathXmlApplicationContext(contexto);
		
		PersonaServiceSpec service;
		
		int idPersona=2;
		
		service=beanFactory.getBean(PersonaServiceSpec.class);
		List<Map<String, Object>>lista;
		lista=service.PropiedadxPersona(idPersona);
		
		for(Map<String,Object>r:lista){
				
			System.out.println(r.get("nombre")
					+" "+r.get("numero")
					+" "+r.get("descripcion"));

		}	
		}

}
