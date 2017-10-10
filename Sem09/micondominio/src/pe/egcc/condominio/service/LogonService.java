package pe.egcc.condominio.service;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import pe.egcc.condominio.model.Persona;

@Service
public class LogonService extends AbstractDBSupport{

  
  public Persona validarUsuario(String usuario, String clave){
    Persona bean = null;
    try {
      String sql = "select idpersona,idtpersona,apellido,"
          + "nombre,dni,email,telefono,direccion "
          + "from persona "
          + "where idpersona in (select idpersona "
          + "from usuario "
          + "where usuario = ? and clave = SHA(?) "
          + "and estado = 1)";
      bean = jdbcTemplate.queryForObject(sql, 
          new BeanPropertyRowMapper<>(Persona.class), 
          usuario, clave);
    } catch (EmptyResultDataAccessException e) {
      throw new RuntimeException("Datos incorrectos.");
    }
    return bean;
  }
}
