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
    		+ "where o.aud_idpersona=?;";
    lista = jdbcTemplate.queryForList(sql, idpersona);
   
    // Fin de proceso
    return lista;
}

@Override
public List<Map<String, Object>> listartipopersonas() {
	List<Map<String, Object>> lista;
	// Inicio de proceso
	String sql = "select idtpersona, nombre from tpersona "
			+ "where idtpersona not like '1'";
	lista = jdbcTemplate.queryForList(sql);

	// Fin de proceso
	return lista;
}

@Override
public List<Map<String, Object>> listarPersonas() {
	List<Map<String, Object>> lista;
	// Inicio de proceso
	String sql = "select idpersona, apellido, nombre, nomtipo, dni, "
			+ "email, telefono, direccion from v_persona where estado=1 "
			+ "order by idpersona asc";
	lista = jdbcTemplate.queryForList(sql);

	// Fin de proceso
	return lista;
}

@Override
public Persona registrarPersona(Persona bean) {
	String sql = "insert into persona (idtpersona,apellido,nombre,dni,email,telefono,direccion,estado) "
			+ "values (?,?,?,?,?,?,?,?)";

	jdbcTemplate.update(sql, bean.toArrayInsert());
	
    sql = "select LAST_INSERT_ID() id";
    
    Integer id = jdbcTemplate.queryForObject(sql, Integer.class);
    bean.setIdpersona(id);
	
	
	return bean;
}

@Override
public void eliminarPersona(int id) {
	
	String sql = "select count(1) cont from usuario "
	        + "where idpersona = ?;";
	    Integer cont = jdbcTemplate.queryForObject(sql, Integer.class,id);
	    if( cont > 0 ){
	      throw new RuntimeException("No se puede eliminar la persona.");
	    }
	    
	    sql = "select count(1) cont from inmueble "
	        + "where idpersona = ?;";
	    cont = jdbcTemplate.queryForObject(sql, Integer.class, id);
	    if( cont > 0 ){
	      throw new RuntimeException("No se puede eliminar la persona.");
	    }
	    
	    sql = "update persona set estado=0 where idpersona = ?;";
	    jdbcTemplate.update(sql, id);
	
}

@Override
public Persona actualizarPersona(Persona bean) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<Map<String, Object>> listarPersonaxID(int id) {
	List<Map<String, Object>> lista;
	// Inicio de proceso
	String sql = "select idtpersona, apellido, nombre, dni, email, "
			+ "telefono from persona "
			+ "where idpersona=?;";
	lista = jdbcTemplate.queryForList(sql, id);

	// Fin de proceso
	return lista;
}



}
