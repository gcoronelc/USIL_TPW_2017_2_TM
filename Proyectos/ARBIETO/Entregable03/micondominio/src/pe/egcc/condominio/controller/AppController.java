package pe.egcc.condominio.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pe.egcc.condominio.model.PersonaModel;
import pe.egcc.condominio.service.LogonService;
import pe.egcc.condominio.service.impl.PersonaServiceImpl;
import pe.egcc.condominio.service.spec.PersonaServiceSpec;

@Controller
public class AppController {

  @Autowired
  private LogonService logonService;
  
  @Autowired
  private PersonaServiceImpl personaServiceImpl;
  
  
 /*
  //envio del Get al detalleInmueble
  @RequestMapping(value="detalleInmueble.htm", method=RequestMethod.GET)
  public String detalleInmueble(){
    return "detalleInmueble";
  }
  
*/
  
  //envio de GET Combo Torre
  @RequestMapping(value="detalleInmueble.htm", method=RequestMethod.GET)
  public String detalleInmueble(Model model){
	//Torre
    List<String> nombres = personaServiceImpl.CargarComboTorre();
    model.addAttribute("nombres", nombres);
    return "detalleInmueble";
  }
  

   
  //Envio de POST leer DetalleInmueble
  @RequestMapping(value="detalleInmueble.htm", method=RequestMethod.POST)
  public String detalleInmueble(
      @RequestParam("nombre") String nomTorre,
      @RequestParam("codPersona") Integer codPersona,
      HttpSession session
      ){
	 //TORRE
	   List<String>nombres;
	   nombres= personaServiceImpl.CargarComboTorre();
	    session.setAttribute("nombres",nombres );
    // DetalleInmueble
	    List<Map<String, Object>> lista;
	    lista = personaServiceImpl.leerDetalleInmueble(nomTorre, codPersona);
	    session.setAttribute("lista", lista);
      return "detalleInmueble";
  }
  

  
  //Envio de GET al resumen
  @RequestMapping(value="resumen.htm", method=RequestMethod.GET)
  public String resumen(){
    return "resumen";
  }
  
  //envio de lista con paremetros a resumen
  @RequestMapping(value="resumen.htm", method=RequestMethod.POST)
  public String resumen(
      @RequestParam("DNI") String DNI,
      @RequestParam("PROPIETARIO") String PROPIETARIO,
      HttpSession session){
    
    List<Map<String, Object>> resumen;
    resumen = personaServiceImpl.leerPersonas(DNI, PROPIETARIO);
    
    session.setAttribute("lista", "lista");
    session.setAttribute("DNI", DNI);
    session.setAttribute("PROPIETARIO", PROPIETARIO);
    session.setAttribute("codInmueble", null);
    
    return "resumen";
  }
  
  
  //envio de GET Combo Tpersona
  @RequestMapping(value="personaTipo.htm", method=RequestMethod.GET)
  public String personaTipo(Model model){
	//TipoPersona
    List<String> nombres = personaServiceImpl.CargarComboTipoPersona();
    model.addAttribute("nombres", nombres);
    return "personaTipo";
  }
  
  //Envio de POST leer persona
  @RequestMapping(value="personaTipo.htm", method=RequestMethod.POST)
  public String personaTipo(
      @RequestParam("nombre") String nombre,
      Model model
      ){
	 //TipoPersona
	   List<String>nombres;
	   nombres= personaServiceImpl.CargarComboTipoPersona();
	    model.addAttribute("nombres",nombres );
    // Resumen
	    List<Map<String, Object>> lista;
	    lista = personaServiceImpl.leerPersonaTipo(nombre);
	    model.addAttribute("lista", lista);
      return "personaTipo";
  }
  
  //Envio de GET a la pagina Inicial
  @RequestMapping(value="index.htm", method=RequestMethod.GET)
  public String index(){
    return "index";
  }
  
  //envio de GET main validando datos
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
  
  //Validando Usuario con metodo POST
  @RequestMapping(value="ingresar.htm", method=RequestMethod.POST)
  public String ingresar(
      @RequestParam("usuario") String usuario,
      @RequestParam("clave") String clave,
      HttpSession session,
      Model model
      ){
    String destino;
    try {
      PersonaModel bean = logonService.validarUsuario(usuario, clave);
      session.setAttribute("usuario", bean);
      destino = "main";
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
      destino = "index";
    }   
    return destino; 
  }
  
  //Proceso de Slida de Pagina
  @RequestMapping(value="salir.htm", method=RequestMethod.GET)
  public String salir(
      HttpSession session
      ){
    session.invalidate();
    return "index";
  }
}
