package pe.usil.condominio.service.espec;


import java.util.List;
import java.util.Map;

import pe.usil.condominio.model.Recibo;

public interface CondominioServiceEspec {
	
	List<Map<String, Object>> listarRecibos();
	List<Map<String, Object>> listarTiposObligacion();
	Recibo registrarRecibo(Recibo bean);
	List<Map<String, Object>> listarRecibosxid(int id);
	void registrarObligacionAgua(int id);
	List<Map<String, Object>> listarEventos(int id);
	List<Map<String, Object>> compruebadisponibilidadAu(String fecha);
	void registraEvento(int id, String fechare, String descr, int limp);
}
