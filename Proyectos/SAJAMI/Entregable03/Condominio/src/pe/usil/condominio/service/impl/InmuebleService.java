package pe.usil.condominio.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import pe.usil.condominio.model.DetInmueble;
import pe.usil.condominio.model.Persona;
import pe.usil.condominio.service.espec.InmuebleServiceEspec;

@Service
public class InmuebleService implements InmuebleServiceEspec {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Map<String, Object>> listarInmuebles(int idpersona) {
		List<Map<String, Object>> lista;
	    // Inicio de proceso
	    String sql = "select i.idinmueble, i.piso, i.numero, "
	    		+ "i.descripcion, p.nombre as dueno, "
	    		+ "ti.nombre as tinmueble, t.nombre as ntorre "
	    		+ "from inmueble i inner join persona p "
	    		+ "on i.idpersona=p.idpersona left join "
	    		+ "tinmueble ti on i.idtinmueble=ti.idtinmueble "
	    		+ "left join torre t on i.idtorre=t.idtorre "
	    		+ "where p.idpersona=?;";
	    lista = jdbcTemplate.queryForList(sql, idpersona);
	   
	    // Fin de proceso
	    return lista;
	}

	@Override
	public List<Map<String, Object>> listarDetInmuebles(int idinmueble) {
		List<Map<String, Object>> lista;
		
	    // Inicio de proceso
	    String sql = "select idobligacion, "
	    		+ "idtobligacion, idinmueble, "
	    		+ "descripcion, anio, mes, "
	    		+ "importe from obligacion "
	    		+ "where idinmueble=?;";
	    lista = jdbcTemplate.queryForList(sql, idinmueble);
	    // Fin de proceso
	    return lista;
		
	}
	
}
