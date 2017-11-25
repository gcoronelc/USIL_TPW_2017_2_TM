package pe.egcc.condominio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pe.egcc.condominio.model.Mensaje;
import pe.egcc.condominio.model.Persona;
import pe.egcc.condominio.service.PersonaService;

@Controller
public class PersonaController {

  @Autowired
  private PersonaService personaService;
  
  @RequestMapping(value="mantpersonas.htm", method=RequestMethod.GET)
  public String mantpersonas(){
    return "mantpersonas";
  }
  
  @RequestMapping(value="personaTraerVarios.htm", 
      method=RequestMethod.GET,
      produces="application/json")
  public @ResponseBody String personaTraerVarios(
      @RequestParam("apellido") String apellido,
      @RequestParam("nombre") String nombre
      ){
    
    List<Persona> lista = personaService.leer(nombre, apellido);
    
    Gson gson = new Gson();
    String jsonText = gson.toJson(lista);
    
    return jsonText;
  }
  
  
  @RequestMapping(value="personaInsertar.htm", 
      method=RequestMethod.POST,
      produces="application/json")
  public @ResponseBody String personaInsertar(
      @ModelAttribute Persona persona){
    
    Mensaje mensaje = new Mensaje();
    
    try {
      
      persona = personaService.crear(persona);
      mensaje.setCode(1);
      mensaje.setMensaje("Proceso ejecutado correctamente. ID=" 
      + persona.getIdpersona() + ".");
      
    } catch (Exception e) {
      mensaje.setCode( -1 );
      mensaje.setMensaje("Error en el proceso");
    }
    
    Gson gson = new Gson();
    String jsonText = gson.toJson(mensaje);
    
    return jsonText;
  }
  
  
}
