package pe.egcc.condominio.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.egcc.condominio.model.Obligacion;

@Service
public class AguaService extends AbstractDBSupport {

	 //////////////////////////////////////////////////////////////////////////////////
	  //Obligacion de Agua
	  //////////////////////////////////////////////////////////////////////////////////
	  
	  @Transactional(propagation=Propagation.REQUIRES_NEW,
		      rollbackFor=Exception.class)
		  public void creaCuotaAgua(int anio, int mes, int idpersona){
		    
		    String sql = "select count(*) cont "
		        + "from obligacion "
		        + "where anio = ? and mes = ? "
		        + "and idtobligacion = 1";
		    Object[] args = {anio, mes};
		    int cont = jdbcTemplate.queryForObject(sql, args, Integer.class);
		    if(cont > 0){
		      throw new RuntimeException("La obligación ya existe.");
		    }
		    
		    // Los immuebles
		    sql = "select i.idinmueble, ti.cmante "
		        + "from tinmueble ti "
		        + "join inmueble i "
		        + "on ti.idtinmueble = i.idtinmueble "
		        + "where ti.cmante > 0 "
		        + "for update ";
		    
		    List<Map<String,Object>> lstImuebles;
		    lstImuebles = jdbcTemplate.queryForList(sql);
		    
		    // Fecha
		    String fecha = anio + "-" + mes + "-01";
		    
		    // Proceso
		    sql = "insert into obligacion(idtobligacion,idinmueble, "
		        + "anio,mes,fvence,importe,fecha,audidpersona) values "
		        + "(2,?,?,?, last_day(?), ?, sysdate(), ?)";
		    for (Map<String,Object> r : lstImuebles) {
		      args = new Object[]{
		          r.get("idinmueble"),
		          anio,
		          mes,
		          fecha,
		          r.get("cmante"),
		          idpersona
		      };
		      jdbcTemplate.update(sql, args);
		    }
		    
		  }
		  
		  public List<Obligacion> generaCuotaAgua(int anio, int mes){
		    
		    String sql = "select count(*) cont "
		        + "from obligacion "
		        + "where anio = ? and mes = ? "
		        + "and idtobligacion = 1";
		    Object[] args = {anio, mes};
		    int cont = jdbcTemplate.queryForObject(sql, args, Integer.class);
		    if(cont > 0){
		      throw new RuntimeException("La obligación ya existe.");
		    }
		    
		    // Los immuebles
		    sql = "select i.idinmueble, ti.cmante,"
		        + "i.codigo, i.idtorre, i.piso, i.descripcion "
		        + "from tinmueble ti "
		        + "join inmueble i "
		        + "on ti.idtinmueble = i.idtinmueble "
		        + "where ti.cmante > 0 ";
		    
		    List<Map<String,Object>> lstImuebles;
		    lstImuebles = jdbcTemplate.queryForList(sql);
		    
		    // Fecha
		    String fecha = anio + "-" + mes + "-01";
		    sql = "select last_day(?) fecha";
		    Date fechaVence = jdbcTemplate.queryForObject(sql, Date.class, fecha);
		    
		    
		    
		    // Proceso
		    List<Obligacion> obligaciones = new ArrayList<>();
		    for (Map<String,Object> r : lstImuebles) {
		      
		      Obligacion bean = new Obligacion();
		      bean.setId(0);
		      bean.setInmueble(Integer.parseInt(r.get("idinmueble").toString()));
		      bean.setCodigo(r.get("codigo").toString());
		      bean.setTorre(Integer.parseInt(r.get("torre").toString()));
		      bean.setPiso(Integer.parseInt(r.get("piso").toString()));
		      bean.setNomobligacion("nomobligacio");
		      bean.setDescripcion(r.get("descripcion").toString());
		      bean.setPagada("NOSE");
		      bean.setAnio(anio);
		      bean.setMes(mes);
		      bean.setVencimiento(fechaVence);
		      bean.setImporte(Double.parseDouble(r.get("importe").toString()));
		      
		      obligaciones.add(bean);
		      
		    }
		    
		    return obligaciones;
		  }
		  
		  
		  
		  
		  public List<Obligacion> leerObligacionAgua( Integer periodo, Integer mes, Integer tipo){
			  
			  String sql = "select id,inmueble,codigo,torre,piso,descripcion, "
			  		+ "obligacion,nomobligacion,anio,mes, "
			  		+ "vencimiento,importe,pagada "
			  		+ "from v_obligacion  "
			  		+ "where anio = ? "
			  		+ "and mes = ? "
			  		+ "and obligacion = ? ";
			  
			  List<Obligacion> lista = jdbcTemplate.query(sql,
					  new BeanPropertyRowMapper<Obligacion>(Obligacion.class), periodo, mes, tipo);
			  
			  return lista;
		  }
		  
	  
	
}
