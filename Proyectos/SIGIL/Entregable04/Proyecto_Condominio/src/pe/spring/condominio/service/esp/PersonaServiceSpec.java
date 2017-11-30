package pe.spring.condominio.service.esp;

import java.util.List;
import java.util.Map;


public interface PersonaServiceSpec {
	
 
	//listar personas 
	public List<Map<String, Object>>ListarPersona();
	//listar personas dependiendo estado
	public List<Map<String, Object>>ListarPropietarios();
   //lista Importe Importe
	public List<Map<String,Object>>ListarImporte(String persona);
	
	public List<Map<String, Object>> PropiedadxPersona(int idPersona);
	
	public List<Map<String, Object>> ListaxPersona(int idPersona);
	
	public List<Map<String, Object>>Rol_x_persona(int idtpersona);
	
	public void ModificarPersona(int idtperson, String nombre ,String apellido, String dni,String email, String 
			telefono, String direccion,int idpersona);
	
	public void deletePersona(int cod);
	
	public List<Map<String, Object>> buscarPersona(String busqueda);
	
	public void regsitrarPersona(int idtpersona, String nombre, String apellido, String dni,
			String email, String telefono, String direccion);
	
	public List<Map<String, Object>> personaSola();
}
