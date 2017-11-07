package pe.egcc.edutec.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pe.egcc.edutec.service.spec.CursoServiceSpec;

@Controller
public class CursoController {
  
  @Autowired
  private CursoServiceSpec cursoService;

  @RequestMapping(value="index.htm", method=RequestMethod.GET)
  public String index(){
    return "index";
  }
  
  @RequestMapping(value="resumen.htm", method=RequestMethod.GET)
  public String resumen(){
    return "resumen";
  }
  
  @RequestMapping(value="resumen.htm", method=RequestMethod.POST)
  public String resumen(
      @RequestParam("ciclo") String ciclo,
      HttpSession session){
    
    List<Map<String, Object>> resumen;
    resumen = cursoService.leerResumenCurso(ciclo);
    session.setAttribute("resumen", resumen);
    session.setAttribute("ciclo", ciclo);
    session.setAttribute("curso", null);
    
    return "resumen";
  }
  
  @RequestMapping(value="detalle.htm", method=RequestMethod.GET)
  public String detalle(
      @RequestParam("ciclo") String ciclo,
      @RequestParam("curso") String curso,
      HttpSession session){
    
    List<Map<String, Object>> detalle;
    detalle = cursoService.leerDetalle(ciclo, curso);
    session.setAttribute("detalle", detalle);
    session.setAttribute("curso", curso);
    
    return "resumen";
  }
  
  @RequestMapping(value="detalle.htm", method=RequestMethod.POST)
  public String detalle(){
    return "resumen";
  }
  
}
