package condominio.jeaguer.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.Inmueble;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.TInmueble;
import condominio.jeaguer.model.Torre;


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
	
	public void registrarInmueble(Inmueble bean) {

		String sql = "insert into inmueble(piso,numero,descripcion,"
				+ "idpro,idtinmueble,idtorre,activo) "
				+ "values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
	}

	public void actualizarInmueble(Inmueble bean){
		String sql = "udpate inmueble set piso=?,numero=?,descripcion=?,"
				+ "idpro=?,idtinmueble=?,idtorre=?,activo=? where idinmueble=?";
		
		jdbcTemplate.update(sql, bean.getPiso(), bean.getNumero(), 
				bean.getDescripcion(),bean.getIdpro(), bean.getIdtinmueble(),
				bean.getIdtorre(), bean.getActivo(), bean.getIdinmueble());
	}
	
	public List<TInmueble> combotiInmueble() {
		List<TInmueble> lista = null;

		try {
			String sql = "select idtinmueble,nombre from tinmueble ";
			lista = jdbcTemplate.query(sql, new BeanPropertyRowMapper<TInmueble>(TInmueble.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}

		return lista;
	}
	
	public List<Torre> comboTorre() {
		List<Torre> lista = null;

		try {
			String sql = "select idtorre,nombre from torre ";
			lista = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Torre>(Torre.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}

		return lista;
	}
	
	public List<Propietario> listapropie() {
		List<Propietario> lista = null;

		try {
			String sql = "select idpro,apellido,nombre  from propietario where estado=1 ";
			lista = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Propietario>(Propietario.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}

		return lista;
	}
	


}
