package pe.egcc.condominio.service;

import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.egcc.condominio.model.Persona;

@Service
public class PersonaService extends AbstractDBSupport {

  public Persona leer( Integer id ){
    Persona bean = null;
    try {
      
      String sql = "select idpersona,apellido,nombre,"
          + "tipo,nomtipo,dni,email,telefono,direccion,"
          + "estado from v_persona where idpersona = ?";
      
      bean = jdbcTemplate.queryForObject(sql,
          new BeanPropertyRowMapper<>(Persona.class), id); 
      
    } catch (EmptyResultDataAccessException e) {
    }
    return bean;
  }
  
  public List<Persona> leer(String nombre, String apellido){
    
    String sql = "select idpersona,apellido,nombre,"
        + "tipo,nomtipo,dni,email,telefono,direccion,"
        + "estado from v_persona "
        + "where nombre like concat('%',?,'%') "
        + "and apellido like concat('%',?,'%') ";
    
    List<Persona> lista = jdbcTemplate.query(sql,
        new Object[]{nombre,apellido}, 
        new BeanPropertyRowMapper<>(Persona.class)); 
    
    return lista;
  }
  
  @Transactional(propagation=Propagation.REQUIRES_NEW,
      rollbackFor=Exception.class)
  public Persona crear(Persona bean){
    
    String sql = "insert into persona(idtpersona,apellido,"
        + "nombre,dni,email,telefono,direccion,estado) "
        + "values(?,?,?,?,?,?,?,?)";
    
    jdbcTemplate.update(sql, bean.getTipo(), bean.getApellido(),
        bean.getNombre(), bean.getDni(), bean.getEmail(),
        bean.getTelefono(), bean.getDireccion(), bean.getEstado());
    
    sql = "select LAST_INSERT_ID() id";
    
    Integer id = jdbcTemplate.queryForObject(sql, Integer.class);
    bean.setIdpersona(id);
    
    return bean;
  }
  
  @Transactional(propagation=Propagation.REQUIRES_NEW,
      rollbackFor=Exception.class)
  public void actualizar(Persona bean){
    
    String sql = "update persona set idtpersona = ?, "
        + "apellido = ?,nombre = ?, dni = ?, email = ?, "
        + "telefono = ?, direccion = ?, estado = ? "
        + "where idpersona = ? ";
    
    jdbcTemplate.update(sql, bean.getTipo(), bean.getApellido(),
        bean.getNombre(), bean.getDni(), bean.getEmail(),
        bean.getTelefono(), bean.getDireccion(), 
        bean.getEstado(), bean.getIdpersona());
    
  }
  
  @Transactional(propagation=Propagation.REQUIRES_NEW,
      rollbackFor=Exception.class)
  public void eliminar(Integer id){
    
    String sql = "select count(1) cont from usuario "
        + "where idpersona = ? ";
    Integer cont = jdbcTemplate.queryForObject(sql, Integer.class);
    if( cont > 0 ){
      throw new RuntimeException("No se puede eliminar la persona.");
    }
    
    sql = "select count(1) cont from inmueble "
        + "where idpersona = ? ";
    cont = jdbcTemplate.queryForObject(sql, Integer.class);
    if( cont > 0 ){
      throw new RuntimeException("No se puede eliminar la persona.");
    }
    
    sql = "delete from persona where idpersona = ? ";
    jdbcTemplate.update(sql, id);
    
  }
  
  
  
  
}
