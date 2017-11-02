package pe.egcc.edutec.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.edutec.model.ResumenCursoModel;
import pe.egcc.edutec.service.impl.CursoService;
import pe.egcc.edutec.service.spec.CursoServiceSpec;

public class Prueba02 {

  public static void main(String[] args) {
    // Instanciando el contexto
    String contexto = "/pe/egcc/edutec/prueba/contexto.xml";
    BeanFactory beanFactory;
    beanFactory = new ClassPathXmlApplicationContext(contexto);

    // Accediendo a un bean
    CursoServiceSpec service;
    service = beanFactory.getBean(CursoServiceSpec.class);
    
    // Proceso
    String ciclo = "2017-01";
    List<Map<String,Object>> lista;
    lista = service.leerResumenCurso(ciclo);
    
    // Reporte
    for (Map<String,Object> r : lista) {
      System.out.println(r.get("curso") 
          + " - " + r.get("secciones")
          + " - " + r.get("ingresos"));
    }
    
  }
}
