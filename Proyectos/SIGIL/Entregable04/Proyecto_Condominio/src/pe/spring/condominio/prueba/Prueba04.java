package pe.spring.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.service.esp.PersonaServiceSpec;

public class Prueba04 {
	public static void main(String[] args) {
		
		String contexto="/pe/spring/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory=new ClassPathXmlApplicationContext(contexto);
		
		PersonaServiceSpec service;
		service=beanFactory.getBean(PersonaServiceSpec.class);
		List<Map<String, Object>>lista;
		lista=service.ListarPropietarios();
		
		for(Map<String,Object>r:lista){
			
			System.out.println(r.get("idpersona")
					+" "+r.get("idtpersona")
					+" "+r.get("apellido")
					+" "+r.get(" nombre")
					+" "+r.get("dni")
					+" "+r.get("email")
					+" "+r.get("telefono")
					+" "+r.get("direccion"));
		}
				
		}

}
