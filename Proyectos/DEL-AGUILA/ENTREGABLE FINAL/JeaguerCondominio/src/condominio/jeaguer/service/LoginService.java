package condominio.jeaguer.service;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.Administrador;
import condominio.jeaguer.model.Propietario;

@Service
public class LoginService extends AbstractDBSupport {

	public Propietario validarIngreso(String usuario, String clave) {

		Propietario bean = null;

		try {
			String sql = "select idpro,apellido,nombre,dni,email,telefono "
					+ "from propietario where usuario = ? and clave = SHA(?) and estado=1";
			bean = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Propietario.class), usuario, clave);
		} catch (EmptyResultDataAccessException e) {
			//e.printStackTrace();
			//throw new RuntimeException("Datos Incorrectos");
		}
		return bean;
	}

	public Administrador validarLogin(String usuario, String clave) {
		Administrador bean = null;
		try {
			String sql = "select idadmin,apellido,nombre,dni,email,telefono,direccion "
					+ "from administrador where usuario = ? and clave = SHA(?) and estado=1";
			bean = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Administrador.class), usuario, clave);
		} catch (EmptyResultDataAccessException e) {
			///e.printStackTrace();
			// throw new RuntimeException("Datos Incorrectos");
		}
		return bean;
	}
	
	public List<Propietario> listaPropietarios(){
		List<Propietario> lista=null;
		
		try {
			String sql = "select idpro,apellido,nombre,dni,email,telefono,estado from propietario ";
			lista = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Propietario>(Propietario.class));
		} catch (EmptyResultDataAccessException e) {
			//e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}
		
		return lista;
	}
	
	/*public Propietario registrarPropietario(String apellido, String nombre,String dni,String email, String telefono,String usuario, String clave, int estado) {

		Propietario bean = null;

		try {
			String sql = "insert into propietario(apellido,nombre,dni,email,telefono,usuario,clave,estado) "
					+ "values(?,?,?,?,?,?,SHA(?),?)";
			bean = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Propietario.class),apellido,nombre,dni,email,telefono,usuario,clave,estado);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se pudo Registrar");
		}
		return bean;
	}*/


}
