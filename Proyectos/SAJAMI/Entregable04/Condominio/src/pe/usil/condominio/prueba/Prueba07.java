package pe.usil.condominio.prueba;



import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.model.Persona;


import pe.usil.condominio.service.impl.PersonaService;


public class Prueba07 {
public static void main(String[] args){
		
		// Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);
	    PersonaService service;
		try {
			service = beanFactory.getBean(PersonaService.class);
			Persona bean = new Persona();
			bean.setIdtpersona(2);
			bean.setApellido("pruebaa");
			bean.setNombre("prueban");
			bean.setDni("12345678");
			bean.setEmail("algo@xd.com");
			bean.setTelefono("123456");
			bean.setDireccion("my house");
			bean.setEstado(1);
			service.registrarPersona(bean);
			System.out.println("Registro Ok");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	    
	    
		    
	 // Reporte

	  }
}
