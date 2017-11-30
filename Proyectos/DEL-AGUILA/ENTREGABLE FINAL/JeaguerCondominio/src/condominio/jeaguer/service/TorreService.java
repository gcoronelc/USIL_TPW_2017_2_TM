package condominio.jeaguer.service;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.Torre;


@Service
public class TorreService extends AbstractDBSupport {
	
	public void registrarTorre(Torre bean) {

		String sql = "insert into torre(nombre) "
				+ "values(?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
	}
	
	public List<Torre> listaTorre() {
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

}
