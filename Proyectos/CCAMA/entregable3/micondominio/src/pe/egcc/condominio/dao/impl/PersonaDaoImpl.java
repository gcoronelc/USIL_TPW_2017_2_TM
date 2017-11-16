package pe.egcc.condominio.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import pe.egcc.condominio.dao.espec.PersonaDaoEspec;
import pe.egcc.condominio.model.PersonaModel;

@Repository
public class PersonaDaoImpl implements PersonaDaoEspec {

	@Autowired
	private JdbcTemplate jdbcTemplate;


	@Override
	public List<Map<String, Object>> traerLista() {
		 List<Map<String, Object>> lista;
		    
		    String sql="select idpersona,idtpersona,apellido,nombre,dni,"
		    		+ "email,telefono, direccion from persona where idtpersona=2";
		    lista=jdbcTemplate.queryForList(sql);
		     
		    return lista;
	}


	@Override
	public void insertar(PersonaModel bean) {
		String sql = "insert into persona(idpersona,idtpersona,apellido,nombre,dni,"
		    		+ "email,telefono, direccion) "
				+ "values(?,2,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bean.toArrayInsert());
		
	}


	@Override
	public void actualizar(PersonaModel bean) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void eliminar(String codigo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public PersonaModel mapRow(ResultSet rs) throws SQLException {
		PersonaModel bean=new PersonaModel();
		bean.setIdpersona(rs.getInt("idpersona"));
		bean.setIdtpersona(rs.getInt("idtpersona"));
		bean.setApellido(rs.getString("apellido"));
		bean.setNombre(rs.getString("nombre"));
		bean.setDni(rs.getString("email"));
		bean.setTelefono(rs.getString("telefono"));
		bean.setDireccion(rs.getString("direccion"));
	return bean;	
	}

	
	
}
