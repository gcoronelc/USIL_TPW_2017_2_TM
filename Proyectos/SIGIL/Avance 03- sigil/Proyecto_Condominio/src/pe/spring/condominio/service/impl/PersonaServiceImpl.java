package pe.spring.condominio.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import pe.spring.condominio.service.esp.PersonaServiceSpec;


@Service
public class PersonaServiceImpl implements PersonaServiceSpec {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Map<String, Object>> ListarPersona() {
		
		List<Map<String, Object>> Lista;
		String sql="select  p.idpersona,tp.nombre as tipoNombre,p.nombre,p.apellido,p.dni"
				+ ",p.email,p.telefono,p.direccion from persona p inner join"
				+ " tpersona tp on (p.idtpersona=tp.idtpersona)";
		Lista=jdbcTemplate.queryForList(sql);
		
		return Lista;
	}
	
	@Override
	public List<Map<String, Object>> ListarPropietarios() {
		
		List<Map<String, Object>> Lista;
		String sql="select*from persona where idtpersona=2";
		Lista=jdbcTemplate.queryForList(sql);
		
		return Lista;
	}

	@Override
	public List<Map<String, Object>> ListarImporte(String dni) {
		
		List<Map<String, Object>>Lista;
		String sql="select CONCAT(nombre,' ',apellido) as Nombres "
				+ ",Tipo_obligacion,idtinmueble,numero,aud_fecha,descripcion"
				+ ",importe from v_importe where dni=?";
		
		Lista=jdbcTemplate.queryForList(sql,dni);
		return Lista;
	}
	
	
	
	public List<Map<String, Object>> PropiedadxPersona(int idPersona) {
			
			List<Map<String, Object>>Lista;
			String sql="select ti.nombre,i.numero,i.descripcion from inmueble "
					+ "i inner join tinmueble ti on (ti.idtinmueble=i.idtinmueble)"
					+ "WHERE idpersona=?";
			
			Lista=jdbcTemplate.queryForList(sql,idPersona);
			return Lista;
		}


}
