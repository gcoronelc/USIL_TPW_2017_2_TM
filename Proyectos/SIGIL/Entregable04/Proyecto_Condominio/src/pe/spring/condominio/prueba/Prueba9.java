package pe.spring.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.service.esp.InmuebleServiceEpec;
import pe.spring.condominio.service.esp.PersonaServiceSpec;

public class Prueba9 {
	
public static void main(String[] args) {
		
		String contexto="/pe/spring/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory=new ClassPathXmlApplicationContext(contexto);
		
		InmuebleServiceEpec service;
		
		//int idtPersona=2;
		String busqueda="salazar";
		
		service=beanFactory.getBean(InmuebleServiceEpec.class);
		List<Map<String, Object>>lista = null;
		service.insertarInmueble(2, 2, "julioo cesarrr", 2, 2, 205, 1);
		
		for(Map<String,Object>r:lista){
			System.out.println(r.get("tipoNombre"));

		}	
		}

}
