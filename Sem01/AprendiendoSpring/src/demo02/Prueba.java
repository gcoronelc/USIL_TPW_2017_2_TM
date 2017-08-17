package demo02;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Gustavo Coronel
 */
public class Prueba {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/demo02/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    // Accediendo a un bean
    MateService service;
    service = beanFactory.getBean("mate2", MateService.class);
    
    // Probando el bean
    System.out.println("5 + 2 = " + service.sumar(5, 2));
    
  }

}
