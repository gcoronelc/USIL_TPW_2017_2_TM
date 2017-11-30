package pe.spring.condominio.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
		String sql="SELECT i.idinmueble, i.piso,i.numero,i.descripcion,p.nombre, p.apellido, "
				+ "ti.nombre as NomInmueble,t.nombre as torre , i.activo FROM `inmueble`i inner join persona p on p.idpersona=i.idpersona "
				+ "INNER JOIN tinmueble ti on ti.idtinmueble=i.idtinmueble INNER JOIN torre t on "
				+ "t.idtorre=i.idtorre where i.idpersona=2";
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

	@Override
	public List<Map<String, Object>> Rol_x_persona(int idtpersona) {
			List<Map<String, Object>>Lista1;
			String sql="SELECT tp.nombre from tpersona tp where tp.idtpersona=?";
			Lista1=jdbcTemplate.queryForList(sql,idtpersona);
		
		return Lista1;
	}

	@Override
	public List<Map<String, Object>> ListaxPersona(int idPersona) {
		//Sql datos por la persona
		List<Map<String, Object>> lista;
		String sql="SELECT idpersona,idtpersona,nombre,apellido,direccion,"
				+ "dni,telefono,email FROM `persona` WHERE idpersona=?";
		lista=jdbcTemplate.queryForList(sql,idPersona);
		return lista;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=Exception.class)
	public void ModificarPersona(int idtperson, String nombre, String apellido, String dni, String email,
			String telefono, String direccion, int idpersona) {
		String sql="update persona set idtpersona= ?, nombre = ?,"
				+ "apellido= ?,dni= ?,email= ?,telefono= ?,direccion=? "
						+ "where idpersona= ?";
		jdbcTemplate.update(sql,idtperson,nombre,apellido,dni,email,telefono,direccion, idpersona);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=Exception.class)
	public void deletePersona(int cod) {
		String sql="delete from persona where idpersona=?";
		jdbcTemplate.update(sql,cod);
		
	}

	@Override
	public List<Map<String, Object>> buscarPersona(String busqueda) {
		String sql="select p.idpersona,tp.nombre as tipoNombre,p.nombre,p.apellido,p.dni "
				+ ",p.email,p.telefono,p.direccion from persona p inner join tpersona tp on (p.idtpersona=tp.idtpersona) where CONCAT(' ',p.nombre, p.apellido) LIKE '%'"+busqueda+"'%'";
		List<Map<String, Object>> lista =jdbcTemplate.queryForList(sql);
		return lista;
	}
	
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=Exception.class)
	public void regsitrarPersona(int idtpersona, String nombre, String apellido, String dni,
			String email, String telefono, String direccion ) {
		
		String sql="INSERT into persona(idtpersona,nombre,apellido,dni,email,telefono,direccion) values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,idtpersona,nombre,apellido,dni,email,telefono,direccion);
	}

	@Override
	public List<Map<String, Object>> personaSola() {
		String sql="SELECT idpersona,nombre,apellido FROM persona";
		List<Map<String, Object>> lista;
		lista=jdbcTemplate.queryForList(sql);
		return lista;
	}
	
	

	


}








