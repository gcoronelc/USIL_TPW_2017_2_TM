package pe.egcc.condominio.dao.espec;

import java.util.List;


import pe.egcc.condominio.model.ObligacionModel;

public interface CuotaMantenimientoDaoEspec {
	void creaCuotaMant(int anio, int mes, int idpersona);
	List<ObligacionModel> generaCuotaMant(int anio, int mes);
	List<ObligacionModel> leerObligaciones( Integer periodo, Integer mes, Integer tipo);
}
