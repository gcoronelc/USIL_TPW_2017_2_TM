package pe.egcc.condominio.prueba;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.egcc.condominio.model.Inmueble;
import pe.egcc.condominio.service.AbstractDBSupport;

@Service
public class InmuebleService extends AbstractDBSupport{

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public Inmueble insertar(Inmueble bean) {
		String sql = "insert into inmueble(piso,numero,descripcion,idpersona,"
				+ "idtinmueble,idtorre,activo)values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bean.getPiso(), bean.getNumero(), bean.getDescripcion(),
				bean.getIdpersona(), bean.getIdtinmueble(), bean.getIdtorre(), bean.getActivo());

		
		  sql = "select LAST_INSERT_ID() id;";
		
		  Integer id = jdbcTemplate.queryForObject(sql, Integer.class);
           bean.setIdpersona(id);
		 
		return bean;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void actualizar(Inmueble bean) {
		String sql = "update inmueble set piso=?,numero=?,descripcion=?,idpersona=?,"
				+ "idtinmueble=?,idtorre=? where idinmueble=?";
		jdbcTemplate.update(sql, new Object[] { bean.getPiso(), bean.getNumero(), bean.getDescripcion(),
				bean.getIdpersona(), bean.getIdtinmueble(), bean.getIdtorre(), bean.getIdinmueble() });
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void eliminar(Integer id) {
		String sql = "Select count(*) from obligacion where idinmueble=?";
		Integer cont = jdbcTemplate.queryForObject(sql, Integer.class);
		if (cont > 0) {
			throw new RuntimeException("No se puede eliminar el Inmueble.");
		}
		sql = "Select count(*) from movimiento where idinmueble=?";
		cont = jdbcTemplate.queryForObject(sql, Integer.class);
		if (cont > 0) {
			throw new RuntimeException("No se puede eliminar el Inmueble");
		}
		sql = "delete from inmueble where idinmueble=?";
		jdbcTemplate.update(sql, id);
	}
}
