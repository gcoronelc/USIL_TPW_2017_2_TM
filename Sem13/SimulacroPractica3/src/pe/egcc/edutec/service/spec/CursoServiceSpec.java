package pe.egcc.edutec.service.spec;

import java.util.List;
import java.util.Map;

import pe.egcc.edutec.model.ResumenCursoModel;

public interface CursoServiceSpec {

  List<Map<String, Object>> leerResumenCurso( String ciclo );
  
  List<ResumenCursoModel> leerResumenCurso2( String ciclo );
  
  List<Map<String,Object>> leerDetalle(String ciclo, String curso);
  
}
