package pe.egcc.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.service.AppService;

/**
 *
 * @author Gustavo Coronel
 */
public class Prueba02 {

  public static void main(String[] args) {

    // Instanciando el contexto
    String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    AppService service;
    try {
      
      service = beanFactory.getBean(AppService.class);
      List<Map<String,Object>> lista;
      lista = service.leerInmuebles(null, 1, "COR");

      System.out.println("N: " + lista.size());
      
      for (Map<String, Object> r : lista) {
        
        System.out.println(r.get("torre") + " - "
            + r.get("piso") + " - " 
            + r.get("numero") + " - " 
            + r.get("nompropietario"));
        
      }

    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    
  }

}
