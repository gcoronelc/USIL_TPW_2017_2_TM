package pe.egcc.condominio.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pe.egcc.condominio.model.Estado;
import pe.egcc.condominio.model.Obligacion;
import pe.egcc.condominio.model.Persona;
import pe.egcc.condominio.service.AguaService;


@Controller
public class AguaController {
	
	@Autowired
	  private AguaService aguaService;
	  

	  	@RequestMapping(value="grabarObliAgua.htm", 
	  			method=RequestMethod.POST, produces="application/json")
		public @ResponseBody String grabarObliAgua(
				@RequestParam("periodo") Integer periodo,
				@RequestParam("mes") Integer mes,
				@RequestParam("tipo") Integer tipo,
				HttpSession session
				){
	  		
	  		Estado estado = new Estado();
	  		
	  		try {
	  			
	  			Persona  persona = (Persona) session.getAttribute("usuario");
	  			
	  			aguaService.creaCuotaAgua(periodo, mes, persona.getIdpersona());
	  			
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

		@RequestMapping(value="obliAgua.htm", method=RequestMethod.GET)
		public String obliAgua(){
			return "obliAgua";
		}
		
		
		@RequestMapping(value="leerObligacionAgua.htm", 
		    method=RequestMethod.POST, 
		    produces="application/json")
	  public @ResponseBody String leerObligacionAgua(
	      @RequestParam("periodo") Integer periodo,
	      @RequestParam("mes") Integer mes,
	      @RequestParam("tipo") Integer tipo){
	    
		  List<Obligacion> lista = aguaService
		      .leerObligacionAgua(periodo, mes, tipo);
		  
		  Gson gson = new Gson();
		  String textJson = gson.toJson(lista);
	    
	    return textJson;
	  }
	  
		@RequestMapping(value="generaObligacionAgua.htm", 
	      method=RequestMethod.POST, 
	      produces="application/json")
	  public @ResponseBody String generaObligacionAgua(
	      @RequestParam("periodo") Integer periodo,
	      @RequestParam("mes") Integer mes,
	      @RequestParam("tipo") Integer tipo){
	    
	    List<Obligacion> lista = aguaService
	        .generaCuotaAgua(periodo, mes);
	    
	    Gson gson = new Gson();
	    String textJson = gson.toJson(lista);
	    
	    return textJson;
	  }
		
	  
	 

}
