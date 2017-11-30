package pe.spring.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.service.esp.PersonaServiceSpec;


public class Peuaba03 {

	public static void main(String[] args) {
	String contexto="/pe/spring/condominio/prueba/contexto.xml";
   BeanFactory beanFactory;
	beanFactory=new ClassPathXmlApplicationContext(contexto);
	
	PersonaServiceSpec service;
	
	service=beanFactory.getBean(PersonaServiceSpec.class);
	
	List<Map<String, Object>>lista;
	
	lista=service.ListarPersona();
	
	for(Map<String,Object>r:lista){
		
		System.out.println(r.get("idpersona")
				+" "+r.get("idtpersona")
				+" "+r.get("apellido")
				+" "+r.get("nombre")
				+" "+r.get("dni"));
	}
			
	}
		
}
