package pe.egcc.condominio.service;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import pe.egcc.condominio.model.Persona;
import pe.egcc.condominio.model.Usuario;

@Service
public class LogonService extends AbstractDBSupport{

  
  public Usuario validarUsuario(String usuario, String clave){
    Usuario bean = null;
    try {
      String sql = "select idpersona, usuario, idrol, estado "
          + "from usuario where usuario = ? "
          + "and clave = SHA(?) and estado = 1 ";
      bean = jdbcTemplate.queryForObject(sql, 
          new BeanPropertyRowMapper<>(Usuario.class), 
          usuario, clave);
    } catch (EmptyResultDataAccessException e) {
      throw new RuntimeException("Datos incorrectos.");
    }
    return bean;
  }
}
