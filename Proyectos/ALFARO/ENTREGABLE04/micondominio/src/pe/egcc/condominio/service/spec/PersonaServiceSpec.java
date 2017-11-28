package pe.egcc.condominio.service.spec;

import java.util.List;
import java.util.Map;

import pe.egcc.condominio.model.PersonaModel;


public interface PersonaServiceSpec {

	//listado de Personas con parametro TIPO DE PERSONA
	List<Map<String, Object>> leerPersonaTipo( String tpersona);
	//List<PersonaModel> leerPersonaTipo( String tpersona);
	
	//listado de Combo Tipo de Persona
	List<String>CargarComboTipoPersona();
	
	//leer personas por Dni, Apelldos y Nombres
	List<Map<String, Object>> leerPersonas( String PROPIETARIO,String DNI);
	
	//listado de Combo Tipo de Persona
	List<String>CargarComboTorre();
	
	//leer personas por Dni, Apelldos y Nombres
	List<Map<String, Object>> leerDetalleInmueble(String nomTorre, int codPersona );
	
	
}
