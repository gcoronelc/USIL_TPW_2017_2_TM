package pe.spring.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.service.esp.PersonaServiceSpec;

public class Prueba05 {
	
public static void main(String[] args) {
		
		String contexto="/pe/spring/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory=new ClassPathXmlApplicationContext(contexto);
		
		PersonaServiceSpec service;
		
	String dni="89435678";
		
		service=beanFactory.getBean(PersonaServiceSpec.class);
		List<Map<String, Object>>lista;
		lista=service.ListarImporte(dni);
		
		for(Map<String,Object>r:lista){

			System.out.println(r.get("idpersonaa")
					+" "+r.get("persona")
					+" "+r.get("dni")
					+" "+r.get("descInmueble")
					+" "+r.get("descObligacion")
					+" "+r.get("nombreObliTipo")
					+" "+r.get("fecVen")
					+" "+r.get("importeTotal"));
		}	
		}

}
