package condominio.jeaguer.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;


@Service
public class InmuebleService extends AbstractDBSupport {
	
	public List<Map<String, Object>> listaInmueblesxPropietario(int idpro) {
		List<Map<String, Object>> lista ;

		try {
			String sql = "select  i.idinmueble, i.piso,tor.nombre torre,t.nombre,i.numero,i.descripcion from inmueble i"
					+ " inner join tinmueble t on i.idtinmueble=t.idtinmueble"
					+ " inner join torre tor on i.idtorre=tor.idtorre"
					+ " where i.idpro=?";
			lista = jdbcTemplate.queryForList(sql, idpro);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}

		return lista;
	}
	


}
