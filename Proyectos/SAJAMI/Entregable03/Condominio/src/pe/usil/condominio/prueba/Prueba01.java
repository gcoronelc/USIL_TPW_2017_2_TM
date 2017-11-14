package pe.usil.condominio.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.model.Persona;
import pe.usil.condominio.service.impl.PersonaService;

/**
 *
 * @author Gustavo Coronel
 */
public class Prueba01 {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    PersonaService service;
    try {
      service = beanFactory.getBean(PersonaService.class);
      Persona bean = service.validarUsuario("gustavo", "gustavo");
      System.out.println("Apellido: " + bean.getApellido());
      System.out.println("IdRol: " + bean.getIdrol());
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    
  }

}
