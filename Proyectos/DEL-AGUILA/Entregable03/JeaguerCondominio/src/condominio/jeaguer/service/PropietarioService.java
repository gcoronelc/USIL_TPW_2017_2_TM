package condominio.jeaguer.service;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.Propietario;

@Service
public class PropietarioService extends AbstractDBSupport {

	public List<Propietario> listaPropietarios() {
		List<Propietario> lista = null;

		try {
			String sql = "select idpro,apellido,nombre,dni,email,telefono,estado from propietario ";
			lista = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Propietario>(Propietario.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}

		return lista;
	}

	
	public void registrarPropietario(Propietario bean) {

		String sql = "insert into propietario(apellido,nombre,dni,email,telefono,usuario,clave,estado) "
				+ "values(?,?,?,?,?,?,SHA(?),?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
	}
	
	public void actualizarLoginPropietario(Propietario bean){
		String sql="update propietario set usuario=?,clave=SHA(?),estado=? where idpro=?";
		jdbcTemplate.update(sql,bean.getUsuario(),bean.getClave(),bean.getEstado(),bean.getIdpro());
	}
	
	
}
