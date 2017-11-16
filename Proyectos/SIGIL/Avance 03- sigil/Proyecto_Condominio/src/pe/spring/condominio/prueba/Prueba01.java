package pe.spring.condominio.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.spring.condominio.model.Persona;
import pe.spring.condominio.service.LogonService;

/**
 *
 * 
 */
public class Prueba01 {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/pe/spring/condominio/prueba/contexto.xml";
    BeanFactory beanFactory;
    BeanFactory beanFactory3 = beanFactory = new ClassPathXmlApplicationContext(contexto);
	BeanFactory beanFactory2 = beanFactory3;

    LogonService service;
    try {
      service = beanFactory.getBean(LogonService.class);
      Persona bean = service.validarUsuario("gustavo", "gustavo");
      System.out.println("Apellido: " + bean.getApellido()+" "+bean.getNombre());
      System.out.println("IdRol: " + bean.getIdrol());
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    
  }

}
