package pe.egcc.condominio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.regexp.internal.recompile;

import pe.egcc.condominio.dao.espec.CuotaMantenimientoDaoEspec;
import pe.egcc.condominio.dao.impl.CuotaMantenimientoDaoImp;
import pe.egcc.condominio.model.ObligacionModel;

@Service
public class ObligacionManteService {
	@Autowired
	CuotaMantenimientoDaoEspec daoEspec;

	public ObligacionManteService() {
		daoEspec = new CuotaMantenimientoDaoImp();
	}
	
	public void creaCuotaMant(int anio, int mes, int idpersona){
		daoEspec.creaCuotaMant(anio, mes, idpersona);
	}
	
	public List<ObligacionModel> generaCuotaMant(int anio, int mes){
		return daoEspec.generaCuotaMant(anio, mes);
	}
	
	public List<ObligacionModel> leerObligaciones(Integer periodo, Integer mes, Integer tipo){
		return daoEspec.leerObligaciones(periodo, mes, tipo);
	}
}
