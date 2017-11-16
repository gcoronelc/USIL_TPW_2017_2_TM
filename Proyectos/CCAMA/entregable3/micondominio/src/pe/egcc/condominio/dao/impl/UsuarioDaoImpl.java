package pe.egcc.condominio.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import pe.egcc.condominio.dao.espec.UsuarioDaoEspec;
import pe.egcc.condominio.model.UsuarioModel;

@Repository
public class UsuarioDaoImpl implements UsuarioDaoEspec{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Map<String, Object>> traerLista() {
		List<Map<String, Object>> lista;
		
		String sql="";
		lista=jdbcTemplate.queryForList(sql);
		return lista;
	}

	@Override
	public void insertar(UsuarioModel bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void actualizar(UsuarioModel bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void eliminar(String codigo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UsuarioModel mapRow(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
