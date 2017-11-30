package condominio.jeaguer.service;

import java.util.Map;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.Recibo;
@Service
public class ReciboService extends AbstractDBSupport{
	
	public List<Map<String, Object>> listarReciboxAnioxMes(int anio, int mes) {
		List<Map<String, Object>> lista;
		try {
			String sql = "SELECT r.idrecibo,t.nombre as tipo,r.codigo,r.anio,r.mes,r.fVence,r.importe " +
						"FROM RECIBO r JOIN TOBLIGACION t ON r.idtobligacion = t.idtobligacion " +
						"WHERE r.anio=? and r.mes=?;";
			lista = jdbcTemplate.queryForList(sql, anio, mes);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}
		return lista;
	}
	
	public List<Map<String, Object>> listarRecibo() {
		List<Map<String, Object>> lista;
		try {
			String sql = "SELECT r.idrecibo,t.nombre as tipo,r.codigo,r.anio,r.mes,r.fVence,r.importe " +
						"FROM RECIBO r JOIN TOBLIGACION t ON r.idtobligacion = t.idtobligacion ORDER BY anio, mes;";
			lista = jdbcTemplate.queryForList(sql);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("No se encontraron resultados");
		}
		return lista;
	}
	
	public void registrarRecibo(Recibo bean){
		String sql = "insert into RECIBO(idtobligacion,codigo,anio,mes,fVence,importe)"
				+ " values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
	}
}
