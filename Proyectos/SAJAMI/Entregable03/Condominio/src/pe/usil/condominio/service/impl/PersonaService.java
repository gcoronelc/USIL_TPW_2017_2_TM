package pe.usil.condominio.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import pe.usil.condominio.model.Persona;
import pe.usil.condominio.service.espec.PersonaServiceEspec;

@Service
public class PersonaService implements PersonaServiceEspec{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
  public Persona validarUsuario(String usuario, String clave){
    Persona bean = null;
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
          new BeanPropertyRowMapper<>(Persona.class), 
          usuario, clave);
    } catch (EmptyResultDataAccessException e) {
      throw new RuntimeException("Datos incorrectos.");
    }
    return bean;
  }

@Override
public List<Map<String, Object>> listaralldeudas(int idpersona) {
	List<Map<String, Object>> lista;
    // Inicio de proceso
    String sql = "select o.idobligacion, t.nombre, o.idinmueble, "
    		+ "o.descripcion, o.anio, o.mes, o.importe from "
    		+ "obligacion o inner join tobligacion t on "
    		+ "o.idtobligacion=t.idtobligacion inner join "
    		+ "inmueble i on i.idinmueble=o.idinmueble  "
    		+ "where i.idpersona=?;";
    lista = jdbcTemplate.queryForList(sql, idpersona);
   
    // Fin de proceso
    return lista;
}


}
