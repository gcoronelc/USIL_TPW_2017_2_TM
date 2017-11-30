package condominio.jeaguer.service;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.AlquilerAuditorio;
import condominio.jeaguer.model.Inmueble;
import condominio.jeaguer.model.Propietario;


@Service
public class AlquilerAudiService extends AbstractDBSupport{

	public List<Inmueble> listaAuditorios() {
		List<Inmueble> lista = null;

		try {
			String sql = "select idinmueble,descripcion from inmueble where idtinmueble=5 ";
			lista = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Inmueble>(Inmueble.class));
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
	
	public void registrarAlquiler (AlquilerAuditorio bean) {

		String sql = "insert into alquilerauditorio(idinmueble,idpro,fechainicio,fechafin,costo,pagado,limpieza,costolimpieza,total) "
				+ "values(?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
	}
	
}
