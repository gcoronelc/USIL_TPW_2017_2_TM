package pe.spring.condominio.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sun.org.apache.bcel.internal.generic.IDIV;

import pe.spring.condominio.service.esp.InmuebleServiceEpec;

@Service
public class InmuebleServiceImpl implements InmuebleServiceEpec {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor=Exception.class)
	public void insertarInmueble(int idpersona, int idtinmueble, String descrip, int piso, int idtorre,
			int numer, int activo) {
		
		String sql="insert into inmueble(idpersona,idtinmueble,descripcion,piso,idtorre,numero,activo) "
				+ "values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,idpersona,idtinmueble,descrip,piso,idtorre,numer,activo);

	}
	
	public void modificarInmueble(String descrip,int numer, int activo, int idinmueble)
	{
		String sql="update inmueble set descripcion= ?, numero=?, activo=? where idinmueble=?";
		jdbcTemplate.update(sql, descrip,numer,activo, idinmueble);
	}

	@Override
	public List<Map<String, Object>> llenarDatos(int cod) {
	String sql="SELECT i.idinmueble, i.piso,i.numero,i.descripcion,p.nombre, "
			+ "p.apellido,ti.nombre as NomInmueble,t.nombre as torre , i.activo FROM "
			+ "`inmueble`i inner join persona p on p.idpersona=i.idpersona "
			+ "INNER JOIN tinmueble ti on ti.idtinmueble=i.idtinmueble INNER "
			+ "JOIN torre t on t.idtorre=i.idtorre where i.idpersona=2 and i.idinmueble=?";
	List<Map<String, Object>> lista;
	lista=jdbcTemplate.queryForList(sql,cod);
		return lista;
	}

	@Override
	public void EliminarInmueble(int codinmueble) {
		String sql="DELETE from inmueble where idinmueble=?";
		jdbcTemplate.update(sql,codinmueble);
	}

	@Override
	public void Modificar(int idtinmueble, String descrip, int numer, int activo) {
		String sql="update inmueble set descripcion=? ,numero=?,activo=? WHERE idinmueble=?";
		jdbcTemplate.update(sql, descrip,numer,activo,idtinmueble);
	}

}
