package pe.egcc.condominio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pe.egcc.condominio.model.Inmueble;
import pe.egcc.condominio.model.Mensaje;
import pe.egcc.condominio.service.InmuebleService;

@Controller
public class InmuebleController {
	@Autowired
	private InmuebleService service;
	@RequestMapping(value="mantinmueble.htm",method=RequestMethod.GET)
	public String mantinmueble(){	
		
		return"mantinmueble";
	}
	
	@RequestMapping(value="inmuebleInsertar.htm",method=RequestMethod.POST,
			produces="application/json")
	public	@ResponseBody String inmuebleInsertar(@ModelAttribute Inmueble bean){
		
		Mensaje mensaje= new Mensaje();
		try {
			bean=service.insertar(bean);
			mensaje.setCode(1);
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
