package pe.egcc.condominio.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.egcc.condominio.dao.espec.CuotaMantenimientoDaoEspec;
import pe.egcc.condominio.model.ObligacionModel;

@Repository
public class CuotaMantenimientoDaoImp implements CuotaMantenimientoDaoEspec {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)

	@Override
	public void creaCuotaMant(int anio, int mes, int idpersona) {
		String sql = "select count(*) cont " + "from obligacion " + "where anio = ? and mes = ? "
				+ "and idtobligacion = 1";
		Object[] args = { anio, mes };
		int cont = jdbcTemplate.queryForObject(sql, args, Integer.class);
		if (cont > 0) {
			throw new RuntimeException("La obligación ya existe.");
		}

		
		sql = "select i.idinmueble, ti.cmante " + "from tinmueble ti " + "join inmueble i "
				+ "on ti.idtinmueble = i.idtinmueble " + "where ti.cmante > 0 " + "for update ";

		List<Map<String, Object>> lstImuebles;
		lstImuebles = jdbcTemplate.queryForList(sql);

		String fecha = anio + "-" + mes + "-01";
		
		sql = "insert into obligacion(idtobligacion,idinmueble, "
				+ "anio,mes,fecVen,importe,aud_fecha,aud_idpersona) values " + "(2,?,?,?, last_day(?), ?, sysdate(), ?)";
		for (Map<String, Object> r : lstImuebles) {
			args = new Object[] { r.get("idinmueble"), anio, mes, fecha, r.get("cmante"), idpersona };
			jdbcTemplate.update(sql, args);
		}
	}

	@Override
	public List<ObligacionModel> generaCuotaMant(int anio, int mes) {
		String sql = "select count(*) cont "
		        + "from obligacion "
		        + "where anio = ? and mes = ? "
		        + "and idtobligacion = 2";
		    Object[] args = {anio, mes};
		    int cont = jdbcTemplate.queryForObject(sql, args, Integer.class);
		    if(cont > 0){
		      throw new RuntimeException("La obligación ya existe.");
		    }

		    sql = "select i.idinmueble, ti.nomtinmueble,"
		        + "i.numero, i.idtorre, i.piso, i.descripcion "
		        + "from tinmueble ti "
		        + "join inmueble i "
		        + "on ti.idtinmueble = i.idtinmueble "
		        + "where ti.cmante > 0 ";
		    
		    List<Map<String,Object>> lstImuebles;
		    lstImuebles = jdbcTemplate.queryForList(sql);
		    		   
		    String fecha = anio + "-" + mes + "-01";
		    sql = "select last_day(?) fecha";
		    Date fechaVence = jdbcTemplate.queryForObject(sql, Date.class, fecha);

		    List<ObligacionModel> obligaciones = new ArrayList<>();
		    for (Map<String,Object> r : lstImuebles) {
		      
		    	ObligacionModel bean = new ObligacionModel();
		      bean.setId(0);
		      bean.setInmueble(Integer.parseInt(r.get("idinmueble").toString()));
		      bean.setCodigo(r.get("numero").toString());
		      bean.setTorre(Integer.parseInt(r.get("idtorre").toString()));
		      bean.setPiso(Integer.parseInt(r.get("piso").toString()));
		      bean.setNomobligacion("MANTENIMIENTO");
		      bean.setDescripcion(r.get("descripcion").toString());
		      bean.setPagada("NOSE");
		      bean.setAnio(anio);
		      bean.setMes(mes);
		      bean.setVencimiento(fechaVence);
		      bean.setImporte(Double.parseDouble(r.get("cmante").toString()));		      
		      obligaciones.add(bean);		      
		    }		    
		    return obligaciones;	
	}

	@Override
	public List<ObligacionModel> leerObligaciones(Integer periodo, Integer mes, Integer tipo) {
		 String sql = "select id,inmueble,numero,torre,piso,descripcion, "
			  		+ "obligacion,nomobligacion,anio,mes, "
			  		+ "vencimiento,importe,pagada "
			  		+ "from v_obligacion  "
			  		+ "where anio = ? "
			  		+ "and mes = ? "
			  		+ "and obligacion = ? ";
			  List<ObligacionModel> lista = jdbcTemplate.query(sql,
					  new BeanPropertyRowMapper<ObligacionModel>(ObligacionModel.class), periodo, mes, tipo);			  
			  return lista;
	}

}
