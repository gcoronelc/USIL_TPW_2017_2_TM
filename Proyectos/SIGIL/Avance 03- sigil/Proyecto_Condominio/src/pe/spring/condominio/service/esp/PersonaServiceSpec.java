package pe.spring.condominio.service.esp;

import java.util.List;
import java.util.Map;


public interface PersonaServiceSpec {
	
 
	//listar personas 
	List<Map<String, Object>>ListarPersona();
	//listar personas dependiendo estado
	List<Map<String, Object>>ListarPropietarios();
   //lista Importe Importe
	List<Map<String,Object>>ListarImporte(String persona);
	
	List<Map<String, Object>> PropiedadxPersona(int idPersona);
	
}
