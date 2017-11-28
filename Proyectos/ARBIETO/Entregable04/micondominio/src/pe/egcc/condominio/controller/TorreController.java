package pe.egcc.condominio.controller;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pe.egcc.condominio.model.Mensaje;
import pe.egcc.condominio.model.Torre;
import pe.egcc.condominio.service.TorreService;

@Controller
public class TorreController {
	@Autowired
	private TorreService service;
	@RequestMapping(value="manttorre.htm",method=RequestMethod.GET)
	public String  manttorre() {
		return "manttorre";
	}
	@RequestMapping(value="traertodos.htm",method=RequestMethod.GET,
			produces="application/json"	)
	public @ResponseBody String TraerTodos(@RequestParam("nombre") String nombre) {
        List<Torre>lista=service.ListarTodo(nombre);
		Gson gson = new Gson();
	    String jsonText = gson.toJson(lista);	    
	    return jsonText;
		
	}
	
	@RequestMapping(value="insertarTorre.htm",method=RequestMethod.POST,
			produces="application/json")
	public @ResponseBody String insertarTorre(@ModelAttribute Torre torre){
		Mensaje mensaje= new Mensaje();
		try {
			torre=service.insertar(torre);
			mensaje.setCode(1);
			mensaje.setMensaje("Proceso ejecutado correctamente con ID="+torre.getIdtorre());
		} catch (Exception e) {
			mensaje.setCode(-1);
			mensaje.setMensaje("Error Al procesar datos:"+e);
		}
		Gson gson= new Gson();
		String jsontext=gson.toJson(mensaje);
		
		
		return jsontext;
	}
	@RequestMapping(value="actualizarTorre.htm",method=RequestMethod.POST,
			produces="application/json")
	public @ResponseBody String actualizarTorre(@ModelAttribute Torre torre){
		Mensaje mensaje= new Mensaje();
		try {
			service.actualizar(torre);
			mensaje.setMensaje("Proceso ejecutado correctamente");
		} catch (Exception e) {
			mensaje.setCode(-1);
			mensaje.setMensaje("Error Al procesar datos:"+e);
		}
		Gson gson= new Gson();
		String jsontext=gson.toJson(mensaje);
		
		
		return jsontext;
	}
}
