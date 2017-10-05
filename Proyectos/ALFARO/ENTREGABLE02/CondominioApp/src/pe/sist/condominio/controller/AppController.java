package pe.sist.condominio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AppController {

	@RequestMapping(value="index.htm", method=RequestMethod.GET)
	public static String index(){
		return "index";
	}
	
	@RequestMapping(value="inicio.htm", method=RequestMethod.GET)
	public static String inicio(){
		return "inicio";
	}


	
}
