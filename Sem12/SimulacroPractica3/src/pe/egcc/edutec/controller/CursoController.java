package pe.egcc.edutec.controller;

import java.util.List;
import java.util.Map;

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
      Model model){
    
    List<Map<String, Object>> lista;
    lista = cursoService.leerResumenCurso(ciclo);
    model.addAttribute("lista", lista);
    
    return "resumen";
  }
  
}
