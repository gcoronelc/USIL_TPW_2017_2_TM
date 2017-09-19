package pe.egcc.carrito.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pe.egcc.carrito.model.Carrito;
import pe.egcc.carrito.model.Item;

@Controller
public class AppController {

	
	@RequestMapping(value="index.htm", method=RequestMethod.GET)
	public String index(Model model){
	  model.addAttribute("cssIndex", "menuItemCurrent");
		return "index";
	}
	
	@RequestMapping(value="agregar.htm", method=RequestMethod.GET)
	public String agregar(Model model){
	  model.addAttribute("cssAgregar", "menuItemCurrent");
		return "agregar";
	}
	
	@RequestMapping(value="agregar.htm", method=RequestMethod.POST)
	public String agregar(
			@ModelAttribute Item item,
			HttpSession session,
			Model model){
		
		Carrito carrito = dameMiCarrito(session);
		carrito.agregar(item);
		
		model.addAttribute("mensaje", "Proceso ok.");
		
		model.addAttribute("cssAgregar", "menuItemCurrent");
		return "agregar";
	}
	
	@RequestMapping(value="eliminar.htm", method=RequestMethod.GET)
	public String eliminar(
			@RequestParam("id") int id,
			HttpSession session, 
			Model model){
		
		Carrito carrito = dameMiCarrito(session);
		carrito.eliminar(id);
		
		model.addAttribute("cssCarrito", "menuItemCurrent");
		return "carrito";
		
	}
	
	@RequestMapping(value="limpiar.htm", method=RequestMethod.GET)
  public String limpiar(
      HttpSession session, Model model){
    
    Carrito carrito = dameMiCarrito(session);
    carrito.reset();
    
    model.addAttribute("cssCarrito", "menuItemCurrent");
    return "carrito";
    
  }
	
	@RequestMapping(value="carrito.htm", method=RequestMethod.GET)
	public String carrito(Model model){
	  model.addAttribute("cssCarrito", "menuItemCurrent");
		return "carrito";
	}

	private Carrito dameMiCarrito(HttpSession session) {
		if( session.getAttribute("carrito") == null ){
			session.setAttribute("carrito", new Carrito());
		}
		Carrito carrito;
		carrito = (Carrito) session.getAttribute("carrito");
		return carrito;
	}

	
}
