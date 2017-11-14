package pe.usil.condominio.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import pe.usil.condominio.service.espec.CondominioServiceEspec;

@Service
public class CondominioService implements CondominioServiceEspec{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Map<String, Object>> listarRecibos() {
		List<Map<String, Object>> lista;
	    // Inicio de proceso
	    String sql = "select r.idrecibo, t.nombre, "
	    		+ "r.codigo, r.anio, r.mes, r.fecVen, "
	    		+ "r.importe from recibo r left join "
	    		+ "tobligacion t on r.idtobligacion="
	    		+ "t.idtobligacion;";
	    lista = jdbcTemplate.queryForList(sql);
	   
	    // Fin de proceso
	    return lista;
	}

	@Override
	public List<Map<String, Object>> listarTiposObligacion() {
		// TODO Auto-generated method stub
		return null;
	}

}
