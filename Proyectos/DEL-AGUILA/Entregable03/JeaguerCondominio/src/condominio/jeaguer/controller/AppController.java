package condominio.jeaguer.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import condominio.jeaguer.model.Administrador;
import condominio.jeaguer.model.Inquilino;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.Torre;
import condominio.jeaguer.service.PropietarioService;
import condominio.jeaguer.service.TorreService;
import condominio.jeaguer.service.InmuebleService;
import condominio.jeaguer.service.InquilinoService;
import condominio.jeaguer.service.LoginService;

@Controller
public class AppController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private PropietarioService propietarioService;
	@Autowired
	private InmuebleService inmuebleService;
	@Autowired
	private InquilinoService inquilinoService;
	@Autowired
	private TorreService torreService;

	@RequestMapping(value = "index.htm", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "propietario.htm", method = RequestMethod.GET)
	public String propietario() {
		return "propietario";
	}
	
	@RequestMapping(value = "actualizarpro.htm", method = RequestMethod.GET)
	public String actualizarpro(@RequestParam("idpro") int idpro,HttpSession session,Model model) {
		
		session.setAttribute("idpro", idpro);
		model.addAttribute("idpro", idpro);
		return "actualizarpro";
	}
	
	@RequestMapping(value = "nuevatorre.htm", method = RequestMethod.GET)
	public String nuevatorre() {
		return "nuevatorre";
	}

	@RequestMapping(value = "registropro.htm", method = RequestMethod.GET)
	public String registropro() {
		return "registropro";
	}
	
	@RequestMapping(value = "vertorres.htm", method = RequestMethod.GET)
	public String vertorres(Model model) {
		
		try {
			List<Torre> lista=torreService.listaTorre();
			model.addAttribute("lista",lista);
			
		} catch (Exception e) {
			model.addAttribute("error", "No hay torres registradas");
		}
		
		
		return "vertorres";
	}
	
	@RequestMapping(value = "mispropiedades.htm", method = RequestMethod.GET)
	public String mispropiedades(@RequestParam("idpro") int idpro,HttpSession session,Model model) 
	{
		try {
			List<Map<String, Object>> lista;
			lista=inmuebleService.listaInmueblesxPropietario(idpro);
			session.setAttribute("lista", lista);
			session.setAttribute("idpro", idpro);
			
		} catch (Exception e) {
			model.addAttribute("error", "No tiene propiedades");
		}
		return "mispropiedades";
	}
	
	@RequestMapping(value="inquilino.htm",method=RequestMethod.GET)
	public String inquilino(@RequestParam("idinmueble") int idinmueble, Model model) 
	{
		try {
			
			Inquilino bean=inquilinoService.verInquilino(idinmueble);
			model.addAttribute("bean", bean);				
			
		} catch (Exception e) {
			model.addAttribute("error", "No tiene inquilino");
		}
		return "mispropiedades";
	}
	
	
	@RequestMapping(value = "administrador.htm", method = RequestMethod.GET)
	public String administrador() {
		return "administrador";
	}

	@RequestMapping(value = "listapropietarios.htm", method = RequestMethod.GET)
	public String listapropietarios(Model model) {

		List<Propietario> lista=propietarioService.listaPropietarios();
		model.addAttribute("lista",lista);
		
		return "listapropietarios";
	}

	@RequestMapping(value = "ingresar.htm", method = RequestMethod.POST)
	public String ingresar(@RequestParam("usuario") String usuario, @RequestParam("clave") String clave,
			HttpSession session, Model model) {
		Propietario bean = loginService.validarIngreso(usuario, clave);
		Administrador beana = loginService.validarLogin(usuario, clave);
		String destino;
		if (bean != null) {
			session.setAttribute("usuario", bean);
			destino = "propietario";
		} else if (beana != null) {
			session.setAttribute("usuario", beana);
			destino = "administrador";
		} else {
			model.addAttribute("error", "Datos incorrectos");
			destino = "index";
		}
		return destino;
		/*
		 * String destino; try {
		 * 
		 * Propietario bean=loginService.validarIngreso(usuario, clave);
		 * session.setAttribute("usuario", bean); destino="propietario"; } catch
		 * (Exception e) { model.addAttribute("error", e.getMessage());
		 * destino="index"; } return destino;
		 */
	}
	
	@RequestMapping(value = "registropropietario.htm", method = RequestMethod.POST)
	public String registropropietario
	(@RequestParam("apellido") String ape,
	 @RequestParam("nombre") String nom,
	 @RequestParam("dni") String dni,
	 @RequestParam("email") String mail,
	 @RequestParam("telefono") String tel,
	 @RequestParam("usuario") String usu,
	 @RequestParam("clave") String cla,
		Model model	)
	{
		try {
			Propietario bean = new Propietario();
			bean.setApellido(ape);
			bean.setNombre(nom);
			bean.setDni(dni);
			bean.setEmail(mail);
			bean.setTelefono(tel);
			bean.setUsuario(usu);
			bean.setClave(cla);
			bean.setEstado(1);
			propietarioService.registrarPropietario(bean);
			model.addAttribute("mensaje", "Registro exitoso");
			
		} catch (Exception e) {
			model.addAttribute("mensaje", "Error al momento de registrar");
		}
		return "registropro";
	}
	
	
	@RequestMapping(value = "actualizarpropietario.htm", method = RequestMethod.POST)
	public String actualizarpropietario(@RequestParam("idpro") int idpro,@RequestParam("usuario") String usuario
			,@RequestParam("clave") String clave,@RequestParam("estado") int estado,Model model) {
		
		try {
			Propietario bean= new Propietario();
			bean.setUsuario(usuario);
			bean.setClave(clave);
			bean.setEstado(estado);
			bean.setIdpro(idpro);
			propietarioService.actualizarLoginPropietario(bean);
			model.addAttribute("mensaje", "Actualizacion exitosa");
			
		} catch (Exception e) {
			model.addAttribute("mensaje", "Error al momento de actualizar");
		}
		return "actualizarpro";
	}
	
	
	@RequestMapping(value = "registrartorre.htm", method = RequestMethod.POST)
	public String registrartorre (@RequestParam("nombre") String nom,Model model)
	{
		try {
			Torre bean= new Torre();
			bean.setNombre(nom);
			torreService.registrarTorre(bean);
			model.addAttribute("mensaje", "Registro exitoso");
			
		} catch (Exception e) {
			model.addAttribute("mensaje", "Error al momento de registrar");
		}
		return "nuevatorre";
	}

	@RequestMapping(value = "cerrar.htm", method = RequestMethod.GET)
	public String cerrar(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
