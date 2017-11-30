package condominio.jeaguer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import condominio.jeaguer.model.Administrador;
import condominio.jeaguer.model.Estado;
import condominio.jeaguer.model.Obligacion;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.service.CondoService;



@Controller
public class CondoController {
  
  @Autowired
  private CondoService condoService;
  
  
  
  	@RequestMapping(value="grabarObli.htm", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody String grabarObli(
			@RequestParam("periodo") Integer periodo,
			@RequestParam("mes") Integer mes,
			@RequestParam("tipo") Integer tipo,
			HttpSession session
			){
  		
  		Estado estado = new Estado();
  		
  		try {
  			
  			Administrador  persona = (Administrador) session.getAttribute("usuario");
  			
  			condoService.creaCuotaMant(periodo, mes, persona.getIdadmin());
  			
  			estado.setCode(1);
  			estado.setMensaje("Proceso ejecutado correctamente.");
  			
		} catch (Exception e) {
			estado.setCode(-1);
  			estado.setMensaje("Error en el proceso");
		}
  		
  		Gson gson = new Gson();
  		String txtJson = gson.toJson(estado);
  		
		return  txtJson;
	}

	@RequestMapping(value="obliManten.htm", method=RequestMethod.GET)
	public String obliManten(){
		return "obliManten";
	}
	
	
	@RequestMapping(value="leerObli.htm", 
			method=RequestMethod.POST,produces="application/json")
    public @ResponseBody String leerObli(
      @RequestParam("periodo") Integer periodo,
      @RequestParam("mes") Integer mes,
      @RequestParam("tipo") Integer tipo){
    
	  List<Obligacion> lista = condoService.leerObligaciones(periodo, mes, tipo);
	  
	  Gson gson = new Gson();
	  String textJson = gson.toJson(lista);
    
    return textJson;
  }
  
	@RequestMapping(value="generaObli.htm", method=RequestMethod.POST, produces="application/json")
    public @ResponseBody String generaObli(
      @RequestParam("periodo") Integer periodo,
      @RequestParam("mes") Integer mes,
      @RequestParam("tipo") Integer tipo){
    
    List<Obligacion> lista = condoService.generaCuotaMant(periodo, mes);
    
    Gson gson = new Gson();
    String textJson = gson.toJson(lista);
    
    return textJson;
  }
	
  
	
}
