package pe.usil.condominio.service.espec;

import java.util.List;
import java.util.Map;

import pe.usil.condominio.model.DetInmueble;

public interface InmuebleServiceEspec {

	List <Map<String, Object>> listarInmuebles( int idpersona );
	List <Map<String, Object>> listarDetInmuebles(int idinmueble);
	List <Map<String, Object>> listartodoinmueble();
	
}
