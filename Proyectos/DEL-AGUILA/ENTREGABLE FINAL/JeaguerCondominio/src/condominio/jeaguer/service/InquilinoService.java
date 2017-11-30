package condominio.jeaguer.service;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import condominio.jeaguer.model.Inquilino;
import condominio.jeaguer.model.Propietario;

@Service
public class InquilinoService extends AbstractDBSupport{

	public Inquilino verInquilino(int idinmueble ){
	
		Inquilino bean =null;
		
		try {
			String sql = "select idinquilino,idinmueble,apellido,nombre,dni,email,telefono "
					+ "from inquilino where idinmueble = ?  and estado=1";
			bean = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Inquilino>(Inquilino.class), idinmueble);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			// throw new RuntimeException("Datos Incorrectos");
		}
		
		return bean;
	}
	
	public void registrarInquilino(Inquilino bean){
		String sql = "INSERT INTO INQUILINO (idinmueble, apellido, nombre, dni,"
						+ "email, telefono, estado) VALUES (?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
	}
	
}
