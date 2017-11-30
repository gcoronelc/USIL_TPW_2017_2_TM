package pe.spring.condominio.service.esp;

import java.util.List;
import java.util.Map;

public interface InmuebleServiceEpec {
	
	public void insertarInmueble(int idpersona,int idtinmueble, String descrip, int piso, int idtorre,
			int numer, int activo);
	
	public List<Map<String, Object>> llenarDatos(int cod);
	
	public void EliminarInmueble(int codinmueble);
	
	public void Modificar(int idtinmueble, String descrip,int numer, int activo);
}
