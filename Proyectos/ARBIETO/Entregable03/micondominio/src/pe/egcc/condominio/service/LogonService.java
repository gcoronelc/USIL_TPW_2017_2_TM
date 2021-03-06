package pe.egcc.condominio.service;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import pe.egcc.condominio.model.PersonaModel;

@Service
public class LogonService extends AbstractDBSupport{

  
  public PersonaModel validarUsuario(String usuario, String clave){
    PersonaModel bean = null;
    try {
      String sql = "select p.idpersona,p.idtpersona,p.apellido,"
          + "p.nombre,p.dni,p.email,p.telefono,p.direccion,u.idrol "
          + "from persona p "
          + "join usuario u on p.idpersona = u.idpersona "
          + "where p.idpersona in (select idpersona "
          + "from usuario "
          + "where usuario = ? and clave = SHA(?) "
          + "and estado = 1)";
      bean = jdbcTemplate.queryForObject(sql,  
    		  new BeanPropertyRowMapper<>(PersonaModel.class), 
    		  usuario, clave);
    } catch (EmptyResultDataAccessException e) {
      throw new RuntimeException("Datos incorrectos.");
    }
    return bean;
  }
}
