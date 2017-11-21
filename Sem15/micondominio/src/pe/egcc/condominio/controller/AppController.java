package pe.egcc.condominio.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pe.egcc.condominio.model.Persona;
import pe.egcc.condominio.service.LogonService;

@Controller
public class AppController {

  @Autowired
  private LogonService logonService;
  
  @RequestMapping(value="main.htm", method=RequestMethod.GET)
  public String main(HttpSession session){
    
    String destino;
    
    if(session.getAttribute("usuario") == null){
      destino = "index";
    } else {
      destino = "main";
    }
    
    return destino;
    
  }
  
  @RequestMapping(value="index.htm", method=RequestMethod.GET)
  public String index(){
    return "index";
  }
  
  @RequestMapping(value="ingresar.htm", method=RequestMethod.POST)
  public String ingresar(
      @RequestParam("usuario") String usuario,
      @RequestParam("clave") String clave,
      HttpSession session,
      Model model
      ){
    
    String destino;
    
    try {
      Persona bean = logonService.validarUsuario(usuario, clave);
      session.setAttribute("usuario", bean);
      destino = "main";
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
      destino = "index";
    }
    
    return destino;
    
  }
  
  @RequestMapping(value="salir.htm", method=RequestMethod.GET)
  public String salir(
      HttpSession session
      ){
    
    session.invalidate();
    
    return "index";
    
  }
  
  // --------------------------------------------
  // Consultas
  // --------------------------------------------
  @RequestMapping( value="coninmuebles.htm", method=RequestMethod.GET)
  public String coninmuebles() {
    return "coninmuebles";    
  }
  
  public String coninmuebles(
      @RequestParam("inmueble") Integer inmueble,
      @RequestParam("torre") Integer torre,
      @RequestParam("propietario") String propietario){
    return "";
  }
  
  
}
