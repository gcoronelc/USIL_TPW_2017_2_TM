package pe.spring.condominio.controller;


import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pe.spring.condominio.model.Persona;
import pe.spring.condominio.service.LogonService;
import pe.spring.condominio.service.esp.InmuebleServiceEpec;
import pe.spring.condominio.service.esp.PersonaServiceSpec;


@Controller
public class AppControler {
	
	@Autowired
	private LogonService logonservice;
	
	@Autowired
	private PersonaServiceSpec personaServiceSpec;
	@Autowired
	private InmuebleServiceEpec inmuebleSeEspecifica;
	
	
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
	public String Consultasver(
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
	
	
	@RequestMapping(value="main_rol.htm", method=RequestMethod.GET)
	public String main_rol(Model model, @RequestParam("idtpersona") int idtpersona){
		
		List<Map<String, Object>>tpersona;
		tpersona=personaServiceSpec.Rol_x_persona(idtpersona);
		model.addAttribute("tpersona",tpersona);
		return "main";
	}
	
	@RequestMapping(value="main_rol.htm", method=RequestMethod.POST)
	public String main_rol()
	{
		return "main";
	}
	
	@RequestMapping(value="ActualizarPropietario2.htm", method=RequestMethod.POST)
	public String ActualizarPropietario2(){	
		
		return "ActualizarPropietario2";
	}
	
	@RequestMapping(value="ActualizarPropietario2.htm", method=RequestMethod.GET)
	public String ActualizarPropietario2(
			  @RequestParam("cod") Integer cod,
			 Model model){
		List<Map<String, Object>>persona;
		persona=personaServiceSpec.ListaxPersona(cod);
		model.addAttribute("personaAM",persona);
		
		return "ActualizarPropietario2";
	}
	
	

	
	@RequestMapping(value="ConsultasDeletePers.htm", method=RequestMethod.GET)
	public String ConsultasDeletePers(
			  @RequestParam("cod") Integer cod,
			 Model model){
		personaServiceSpec.deletePersona(cod);
		
		return "Consultas";
	}
	
	@RequestMapping(value="ConsultasBuscarPers.htm", method=RequestMethod.GET)
	public String ConsultasBuscarPers(
			  @RequestParam("txt_seach_pers") String busqueda,
			 Model model){
		List<Map<String, Object>>lista=	personaServiceSpec.buscarPersona(busqueda);
		model.addAttribute("item", lista);
		return "Consultas";
	}
	
	@RequestMapping(value="RegistrarPers.htm", method=RequestMethod.GET)
	public String RegistrarPers(@RequestParam ("Idtpersona") int idtpersona,
			@RequestParam ("nom") String nombre, @RequestParam ("apell")String apellido, 
			@RequestParam ("dni") String dni, @RequestParam ("correo") String email,
			@RequestParam ("telf") String telefono,
			@RequestParam("direcc") String direccion ){
		personaServiceSpec.regsitrarPersona(idtpersona, nombre, apellido, dni, email, telefono, direccion);
		
		return "Consultas";
	}
	@RequestMapping(value="ModificarPersona.htm", method=RequestMethod.GET)
	public String ModificarPersona(@RequestParam ("Idtpersona") int idtpersona,
			@RequestParam ("nom") String nombre, @RequestParam ("apell")String apellido, 
			@RequestParam ("dni") String dni, @RequestParam ("correo") String email,
			@RequestParam ("telf") String telefono,
			@RequestParam("direcc") String direccion, @RequestParam("idpesrsona")int idpersona){
		personaServiceSpec.ModificarPersona(idtpersona, nombre, apellido, dni, email, telefono, direccion,idpersona);
			return "Consultas";
		}
	@RequestMapping(value="ModificarPersona.htm", method=RequestMethod.POST)
	public String ModificarPersona(){
			return "Consultas";
		}
	
	
	@RequestMapping(value="RegistrarInmueble.htm", method=RequestMethod.GET)
	  public String RegistrarInmueble(@RequestParam("perNombre") int idpersona,@RequestParam("cmb_inmueble") int idtinmueble,
			  @RequestParam("descrip")String descrip, @RequestParam("piso") int piso, @RequestParam("cmbTorre") int idtorre ,
			  @RequestParam("num_imn") int numer, @RequestParam("radio_estado") int activo, Model model){
		
		String retorna;
		if (idpersona>0 || idtinmueble>=-2 || piso>0 ||idtorre>=1 || numer>1 || activo>=0) {
			inmuebleSeEspecifica.insertarInmueble(idpersona, idtinmueble, descrip, piso, idtorre, numer, activo);
			retorna="listarPropietario";
		}else
		{
			model.addAttribute("error","No se pudo ingresar Inmueble");
			retorna="listarPropietario";
		}
	
	    return retorna; 
	  } 
	
	
	@RequestMapping(value="RegistrarInmueble.htm", method=RequestMethod.POST)
	  public String RegistrarInmueble(){		
	    return "listarPropietario"; 
	  }
	
	@RequestMapping(value="LlenarDAtos.htm", method=RequestMethod.GET)
	  public String LlenarDAtos(@RequestParam("idinmueble")int cod, Model model){		
		
		List<Map<String, Object>> lista;
		// poner los campos para poderlos editar
		lista=inmuebleSeEspecifica.llenarDatos(cod);
		model.addAttribute("inmueble",lista);
	    return "ConsultasActualizarPers"; 
	  }
	
	@RequestMapping(value="ConsultasActualizarPers.htm", method=RequestMethod.GET)
	  public String ConsultasActualizarPers(){		
	    return "ConsultasActualizarPers"; 
	  }
	
	@RequestMapping(value="EliminarInmueble.htm", method=RequestMethod.GET)
	  public String EliminarInmueble(@RequestParam("idinmueble") int idInmueble){		
		
		inmuebleSeEspecifica.EliminarInmueble(idInmueble);
	    return "listarPropietario"; 
	  }
	
	@RequestMapping(value="Modifcar.htm", method=RequestMethod.POST)
	  public String Modifcar(@RequestParam("idinmueble") int idtinmueble ,@RequestParam("descrip") String descrip,@RequestParam("numero") 
	  int numer, @RequestParam("cmb_estado") int active){	
		
		inmuebleSeEspecifica.Modificar(idtinmueble, descrip, numer, active);
		
	    return "listarPropietario"; 
	  }

	
	
	
}
	
	
