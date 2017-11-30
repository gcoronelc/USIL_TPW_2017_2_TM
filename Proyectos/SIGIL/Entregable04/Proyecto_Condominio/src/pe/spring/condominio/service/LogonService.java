package pe.spring.condominio.service;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import pe.spring.condominio.model.Persona;

@Service
public class LogonService extends AbstractDBSupport {
	
	public Persona validarUsuario(String usuario,String clave)
	{
		Persona bean=null;
		try {
			String sql = "select p.idpersona,p.idtpersona,p.apellido,"
			          + "p.nombre,p.dni,p.email,p.telefono,p.direccion,u.idrol "
			          + "from persona p "
			          + "join usuario u on p.idpersona = u.idpersona "
			          + "where p.idpersona in (select idpersona "
			          + "from usuario "
			          + "where usuario = ? and clave = SHA(?) "
			          + "and estado = 1)";
			bean=jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Persona.class), usuario,clave);
			
		} catch (EmptyResultDataAccessException e) {
			throw new RuntimeException("Datos incorrectos.");
		}
		
		return bean;
	}
}
