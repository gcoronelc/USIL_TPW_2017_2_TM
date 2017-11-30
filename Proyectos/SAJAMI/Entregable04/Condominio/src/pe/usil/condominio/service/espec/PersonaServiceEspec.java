package pe.usil.condominio.service.espec;

import java.util.List;
import java.util.Map;

import pe.usil.condominio.model.Persona;




public interface PersonaServiceEspec {
	
	Persona validarUsuario(String usuario, String clave);
	
	List<Map<String, Object>> listaralldeudas(int idpersona);
	
	List<Map<String, Object>> listartipopersonas();
	
	List<Map<String, Object>> listarPersonas();
	
	List<Map<String, Object>> listarPersonaxID(int id);
	
	Persona registrarPersona(Persona bean);
	
	Persona actualizarPersona(Persona bean);
	
	void eliminarPersona(int id);

}
