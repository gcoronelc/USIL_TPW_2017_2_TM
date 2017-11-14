package condominio.jeaguer.prueba;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import condominio.jeaguer.model.Inquilino;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.InquilinoService;
import condominio.jeaguer.service.LoginService;



public class Prueba05 {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/condominio/jeaguer/prueba/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    InquilinoService service;
    try {
      service = beanFactory.getBean(InquilinoService.class);
      Inquilino bean = service.verInquilino(3);
      System.out.println("Apellido: " + bean.getApellido());
      System.out.println("Nombre: " + bean.getNombre());
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    
  }

}
