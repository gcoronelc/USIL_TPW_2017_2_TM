package pe.egcc.condominio.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class AppService extends  AbstractDBSupport{

  public List<Map<String,Object>> leerInmuebles(
      Integer tipo, Integer torre, String propietario){
    
    String sql = "select inmueble, tipo, nomtipo, torre, nomtorre, "
        + "piso, numero, descripcion, activo, propietario, "
        + "nompropietario, agua, mantenimiento, cuota "
        + "from V_INMUEBLE "
        + "where nompropietario like concat('%',?,'%') " ;

    if( propietario == null ){
      propietario = "";
    }
    
    List<Object> args = new ArrayList<>();
    args.add(propietario);
    
    if( tipo != null ){
      sql += " and tipo = ? ";
      args.add(tipo);    
    }
    
    if( torre != null ){
      sql += " and torre = ? ";
      args.add(torre);
    } 
    
    List<Map<String,Object>> repo;
    repo = jdbcTemplate.queryForList(sql, args.toArray());
        
    return repo;
  }
  
  
}
