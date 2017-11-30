package pe.egcc.condominio.service;



import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.egcc.condominio.model.Torre;

@Service
public class TorreService extends AbstractDBSupport{
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public Torre insertar(Torre bean) {
		String sql = "insert into torre (idtorre,nombre)values(?,?)";
		jdbcTemplate.update(sql, bean.getIdtorre(), bean.getNombre());
		sql = "select LAST_INSERT_ID() id;";

		Integer id = jdbcTemplate.queryForObject(sql, Integer.class);
		bean.setIdtorre(id);
		return bean;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void actualizar(Torre bean) {
		String sql = "update torre set nombre=? where idtorre=?";
		jdbcTemplate.update(sql, new Object[] { bean.getNombre(), bean.getIdtorre() });
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void eliminar(Integer id) {
		String sql = "Select count(*) from inmueble where idtorre=?";
		Integer cont = jdbcTemplate.queryForObject(sql, Integer.class);
		if (cont > 0) {
			throw new RuntimeException("No se puede eliminar torre.");

		}
		sql = "delete from torre where idtorre=?";
		jdbcTemplate.update(sql, id);
	}
   public List<Torre>ListarTodo(String nombre){
	   String sql="select * from torre where nombre like concat('%',?,'%')";
	   List<Torre>lista=jdbcTemplate.query(sql, new Object[]{nombre},
			   new BeanPropertyRowMapper<>(Torre.class));
	   return lista;
	  
	  
   }

}
