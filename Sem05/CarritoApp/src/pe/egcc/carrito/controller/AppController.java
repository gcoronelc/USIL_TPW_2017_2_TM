package pe.egcc.carrito.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pe.egcc.carrito.model.Carrito;
import pe.egcc.carrito.model.Item;

@Controller
public class AppController {

	
	@RequestMapping(value="index.htm", method=RequestMethod.GET)
	public static String index(){
		return "index";
	}
	
	@RequestMapping(value="agregar.htm", method=RequestMethod.GET)
	public static String agregar(){
		return "agregar";
	}
	
	@RequestMapping(value="agregar.htm", method=RequestMethod.POST)
	public static String agregar(
			@ModelAttribute Item item,
			HttpSession session,
			Model model){
		
		Carrito carrito = dameMiCarrito(session);
		carrito.agregar(item);
		
		model.addAttribute("mensaje", "Proceso ok.");
		
		return "agregar";
	}
	
	@RequestMapping(value="carrito.htm", method=RequestMethod.GET)
	public static String carrito(){
		return "carrito";
	}

	private static Carrito dameMiCarrito(HttpSession session) {
		if( session.getAttribute("carrito") == null ){
			session.setAttribute("carrito", new Carrito());
		}
		Carrito carrito;
		carrito = (Carrito) session.getAttribute("carrito");
		return carrito;
	}

	
	
	
}
