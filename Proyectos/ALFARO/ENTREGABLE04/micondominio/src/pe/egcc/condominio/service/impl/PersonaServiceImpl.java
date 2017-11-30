package pe.egcc.condominio.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import pe.egcc.condominio.model.PersonaModel;
import pe.egcc.condominio.service.spec.PersonaServiceSpec;
import sun.print.resources.serviceui;

@Service
public class PersonaServiceImpl  implements PersonaServiceSpec{

	  @Autowired
	  private JdbcTemplate jdbcTemplate;
	  
	@Override
	public  List<Map<String, Object>> leerPersonaTipo(String tpersona) {
	    //crear lista
		 List<Map<String, Object>> lista;
	    //consulta de busqueda por tipo de persona
	    String sql="select p.idpersona,tp.nombre,p.apellido,p.nombre,dni,"
	    		+ "p.email,p.telefono, p.direccion from persona p inner join tpersona tp on tp.idtpersona=p.idtpersona "
	    		+ "where tp.nombre=?";
	    lista=jdbcTemplate.queryForList(sql, tpersona);
	     // Fin de proceso
	    return lista;
	}

	@Override
	public List<String> CargarComboTipoPersona() {
		
		//consulta de carga de Tipo de Personas
	    String sql = "select  nombre from tpersona order by 1 desc";
	    List<String> lista = jdbcTemplate.queryForList(sql, String.class);
	    //fin de proceso
	    return lista;
	}

	@Override
	public List<Map<String, Object>> leerPersonas( String DNI, String PROPIETARIO) {
		//Declarando Lista
		List<Map<String, Object>> lista;
		 //Consultando propietarios y catidad de inmuebles que poseen
		 String sql="SELECT CODIGO,PROPIETARIO,DNI,ESTADO,"
		 		+ "CANTIDAD_INMUEBLE "
		 		+ "FROM V_LISTA_PROPIETARIO_INMUEBLE "
		 		+ "WHERE DNI=? or PROPIETARIO LIKE concat(?,'%')";
		 lista=jdbcTemplate.queryForList(sql,DNI,PROPIETARIO);
		//fin de proceso 
		return lista;
	}

	@Override
	public List<String> CargarComboTorre() {
	
		List<String>lista;
		//consulta de carga de Torre
	    String sql = "select nombre from torre order by 1 desc";
	    lista = jdbcTemplate.queryForList(sql, String.class);
	    //fin de proceso
	    return lista;
	}

	@Override
	public List<Map<String, Object>> leerDetalleInmueble(String nomTorre, int codPersona) {
	
		List<Map<String, Object>>lista;
		//conslta de detalle de inmueble
		String sql=" select  codInmueble, codPersona,nomTipoInmueble, nomTorre, piso,"
				+ " numero ,descripcion,estado,agua,mantenimiento,costoMantenimiento "
				+ "from v_DetalleInmueble where nomTorre=? or codPersona=? ";
		lista=jdbcTemplate.queryForList(sql,nomTorre,codPersona);
		//entrega de datos
		return lista;
	}

}
