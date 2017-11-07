package pe.egcc.edutec.prueba;

import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.edutec.model.ResumenCursoModel;
import pe.egcc.edutec.service.impl.CursoService;
import pe.egcc.edutec.service.spec.CursoServiceSpec;

public class Prueba01 {

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
    List<ResumenCursoModel> lista;
    lista = service.leerResumenCurso2(ciclo);
    
    // Reporte
    for (ResumenCursoModel r : lista) {
      System.out.println(r.getCurso() 
          + " - " + r.getSecciones()
          + " - " + r.getIngresos());
    }
    
  }
}
