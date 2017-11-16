package pe.spring.condominio.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pe.spring.condominio.model.Persona;
import pe.spring.condominio.service.LogonService;
import pe.spring.condominio.service.esp.PersonaServiceSpec;


@Controller
public class AppControler {
	
	@Autowired
	private LogonService logonservice;
	
	@Autowired
	private PersonaServiceSpec personaServiceSpec;
	
	
	@RequestMapping(value="main.htm", method=RequestMethod.GET)
	  public String main(){
	    return "main"; 
	  }
	
	@RequestMapping(value="index.htm", method=RequestMethod.GET)
	public String index(){
		return "index";
	}
		
	@RequestMapping(value="cabezera.htm", method=RequestMethod.GET)
	public String cabezera(){
		return "cabezera";
	}
	
	@RequestMapping(value="cabezeraIndex.htm", method=RequestMethod.GET)
	public String cabezeraIndex(){
		return "cabezeraIndex";
	}
	
	@RequestMapping(value="ingresar.htm", method=RequestMethod.POST)
	public String IngresarLogin(
	@RequestParam("usuario") String usuario,
	@RequestParam("clave") String clave,
	HttpSession sesion,
	Model model
	){
		String destino;
		try {
			Persona bean=logonservice.validarUsuario(usuario, clave);
			sesion.setAttribute("usuario", bean);
			destino="main";		
			
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			destino="index";
		}
		return destino;
	}
	
	@RequestMapping(value="salir.htm", method=RequestMethod.GET)
	public String SalirLogin(HttpSession sesion){
		return "index";
	}
	
	@RequestMapping(value="ingresar.htm", method=RequestMethod.GET)
	public String ingresar(){
		
		return "main";
	}
	
	@RequestMapping(value="nuestroEquipo.htm", method=RequestMethod.GET)
	public String Nosotros()	{		
		return "nuestroEquipo";
	}
	
	//listar personas
	
	@RequestMapping(value="Consultas.htm", method=RequestMethod.GET)
	public String consultas(){		
		return "Consultas";
	}
	
	@RequestMapping(value="Consultas.htm", method=RequestMethod.POST)
	public String Consultas(
			Model model){
		
		List<Map<String, Object>>persona;
		persona=personaServiceSpec.ListarPersona();
		model.addAttribute("persona",persona);
		
		return "Consultas";
	}
	
	//listar propietarios
	@RequestMapping(value="listarPropietario.htm", method=RequestMethod.GET)
	public String listarPropietario(){		
		return "listarPropietario";
	}
	
	@RequestMapping(value="listarPropietario.htm", method=RequestMethod.POST)
	public String listarPropietario(
			Model model){
		
		List<Map<String, Object>>propietario;
		propietario=personaServiceSpec.ListarPropietarios();
		model.addAttribute("propietario",propietario);
		
		return "listarPropietario";
	}
	
	@RequestMapping(value="listarImporte.htm", method=RequestMethod.GET)
	public String listarImporte(){		
		return "listarImporte";
	}
	
	@RequestMapping(value="listarImporte.htm", method=RequestMethod.POST)
	public String listarImporte(
			  @RequestParam("dni") String dni,
			 Model model){
		
		List<Map<String, Object>>importe;
		importe=personaServiceSpec.ListarImporte(dni);
		model.addAttribute("importe",importe);
		
		return "listarImporte";
	}
	
	
	@RequestMapping(value="main_calProp.htm", method=RequestMethod.GET)
	public String main_calProp2( ){
	
		return "main";
	}
	
	@RequestMapping(value="main_calProp.htm", method=RequestMethod.POST)
	public String main_calProp()
	{
		return "main";
	}
}
	
	
