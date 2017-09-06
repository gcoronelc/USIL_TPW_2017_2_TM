package demo03;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Gustavo Coronel
 */
public class Prueba {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/demo03/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    // Accediendo a un bean
    AppController control;
    control = beanFactory.getBean(AppController.class);
    
    // Probando el bean
    System.out.println("5 + 2 = " + control.sumar(5, 2));
    
  }

}
