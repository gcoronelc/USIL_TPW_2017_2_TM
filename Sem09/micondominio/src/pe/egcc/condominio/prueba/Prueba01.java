package pe.egcc.condominio.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.model.Persona;
import pe.egcc.condominio.service.LogonService;

/**
 *
 * @author Gustavo Coronel
 */
public class Prueba01 {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    LogonService service;
    try {
      service = beanFactory.getBean(LogonService.class);
      Persona bean = service.validarUsuario("gustavo", "gustavo");
      System.out.println("Hola: " + bean.getApellido());
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    
  }

}
