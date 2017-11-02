package pe.egcc.edutec.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import pe.egcc.edutec.model.ResumenCursoModel;
import pe.egcc.edutec.service.spec.CursoServiceSpec;

@Service
public class CursoService implements CursoServiceSpec{
  
  @Autowired
  private JdbcTemplate jdbcTemplate;

  @Override
  public List<Map<String, Object>> leerResumenCurso(String ciclo) {
    List<Map<String, Object>> lista;
    // Inicio de proceso
    String sql = "select periodo,ciclo,tarifa,nomtarifa,"
        + "curso,nomcurso,horas,precio,pagohora,secciones,"
        + "vacantes,matriculados,disponibles,ingresos,"
        + "pagoprof,utilidad  "
        + "from V_RESUMEN_CURSO "
        + "where ciclo = ?";
    lista = jdbcTemplate.queryForList(sql, ciclo);
    // Fin de proceso
    return lista;
  }

  @Override
  public List<ResumenCursoModel> leerResumenCurso2(String ciclo) {
    List<ResumenCursoModel> lista;
    // Inicio de proceso
    String sql = "select periodo,ciclo,tarifa,nomtarifa,"
        + "curso,nomcurso,horas,precio,pagohora,secciones,"
        + "vacantes,matriculados,disponibles,ingresos,"
        + "pagoprof,utilidad  "
        + "from V_RESUMEN_CURSO "
        + "where ciclo = ?";
    lista = jdbcTemplate.query(sql, 
        new BeanPropertyRowMapper<ResumenCursoModel>(ResumenCursoModel.class), 
        ciclo);
    // Fin de proceso
    return lista;
  }

  
  
}
