package pe.usil.condominio.service.impl;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;

import pe.usil.condominio.model.Persona;
import pe.usil.condominio.model.Recibo;
import pe.usil.condominio.service.espec.CondominioServiceEspec;


@Service
public class CondominioService implements CondominioServiceEspec {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private Utilidad utilidad;

	@Override
	public List<Map<String, Object>> listarRecibos() {
		List<Map<String, Object>> lista;
		// Inicio de proceso
		String sql = "select r.idrecibo, t.nombre, " + "r.codigo, r.anio, r.mes, r.fecVen, "
				+ "r.importe from recibo r left join " + "tobligacion t on r.idtobligacion=" + "t.idtobligacion;";
		lista = jdbcTemplate.queryForList(sql);

		// Fin de proceso
		return lista;
	}

	@Override
	public List<Map<String, Object>> listarTiposObligacion() {
		List<Map<String, Object>> lista;
		// Inicio de proceso
		String sql = "select idtobligacion, nombre from tobligacion";
		lista = jdbcTemplate.queryForList(sql);

		// Fin de proceso
		return lista;
	}

	@Override
	public Recibo registrarRecibo(Recibo bean) {
		
		
		String sql = "insert into recibo (idtobligacion,codigo,anio,mes,fecVen,importe) values (?,?,?,?,?,?)";

		jdbcTemplate.update(sql, bean.toArrayInsert());
		
 
	    return bean;
	}

	@Override
	public List<Map<String, Object>> listarRecibosxid(int id) {
		
			List<Map<String, Object>> lista;
			
			// Inicio de proceso
			String sql = "select idrecibo, idtobligacion, " 
			+ "codigo, anio, mes, fecVen, "
					+ "importe, estadoOb from recibo"
					+ " where idrecibo=? and "
					+ "estadoOb=0;";
			lista = jdbcTemplate.queryForList(sql,id);
			
			
		return lista;
	}

	@Override
	public void registrarObligacionAgua(int id) {
		String sql = "call insertaObligacionAgua(?);";
		jdbcTemplate.update(sql, id);
		sql = "UPDATE recibo set estadoOb=1 where idrecibo=?;";
		jdbcTemplate.update(sql, id);
		
	}

	@Override
	public List<Map<String, Object>> listarEventos(int id) {
		List<Map<String, Object>> lista;
		// Inicio de proceso
		String sql = "select o.descripcion as Descripcion, "
				+ "o.importe as Importe, o.aud_fecha as "
				+ "FechaPedido, r.reserva as FechaReserva "
				+ "from obligacion o inner join reserva r on "
				+ "o.idobligacion=r.idobligacion where "
				+ "o.aud_idpersona=?;";
		lista = jdbcTemplate.queryForList(sql, id);

		// Fin de proceso
		return lista;
	}

	@Override
	public List<Map<String, Object>> compruebadisponibilidadAu(String fecha) {
		List<Map<String, Object>> lista;
		// Inicio de proceso
		String sql = "select reserva from reserva where reserva=?";
		lista = jdbcTemplate.queryForList(sql, fecha);

		// Fin de proceso
		return lista;
	}

	@Override
	public void registraEvento(int id, String fechare, String descr, int limp) {
		String sql = "call insertaEvento(?,?,?,?);";
		jdbcTemplate.update(sql, id, fechare, descr, limp);
		
	}

}
