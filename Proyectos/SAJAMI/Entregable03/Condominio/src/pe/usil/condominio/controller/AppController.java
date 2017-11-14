package pe.usil.condominio.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import pe.usil.condominio.model.DetInmueble;
import pe.usil.condominio.model.Persona;
import pe.usil.condominio.service.espec.CondominioServiceEspec;
import pe.usil.condominio.service.espec.InmuebleServiceEspec;
import pe.usil.condominio.service.espec.PersonaServiceEspec;

@Controller
public class AppController {

	@Autowired
	private PersonaServiceEspec PersonaService;

	@Autowired
	private InmuebleServiceEspec InmuebleService;
	
	@Autowired
	private CondominioServiceEspec CondominioService;

	@RequestMapping(value = "main.htm", method = RequestMethod.GET)
	public String main(HttpSession session) {

		String destino;

		if (session.getAttribute("usuario") == null) {
			destino = "index";

		} else {
			destino = "main";
		}

		return destino;

	}

	@RequestMapping(value = "index.htm", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "ingresar.htm", method = RequestMethod.POST)
	public String ingresar(@RequestParam("usuario") String usuario, @RequestParam("clave") String clave,
			HttpSession session, Model model) {

		String destino;

		try {
			Persona bean = PersonaService.validarUsuario(usuario, clave);
			session.setAttribute("usuario", bean);
			destino = "main";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			destino = "index";
		}

		return destino;

	}

	@RequestMapping(value = "inmuebles.htm", method = RequestMethod.GET)
	public String inmuebles() {
		return "inmuebles";
	}

	@RequestMapping(value = "inmuebles.htm", method = RequestMethod.POST)
	public String inmuebles(@RequestParam("idpersona") int idpersona, HttpSession session,

			Model model) {

		String destino;
		
		try {
			List<Map<String, Object>> listainmuebles;
			listainmuebles = InmuebleService.listarInmuebles(idpersona);
			session.setAttribute("linmuenbles", listainmuebles);

			destino = "inmuebles";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			destino = "inmuebles";
		}

		return destino;
	}

	@RequestMapping(value = "/inmuebles/detinmuebles.htm", method = RequestMethod.GET)
	public @ResponseBody String detinmuebles(@RequestParam("idinmueble") int idinmueble, HttpSession session,
			Model model) {
		String result = "", res="";

		try {
			List<Map<String, Object>> detinmuebles;
			detinmuebles = InmuebleService.listarDetInmuebles(idinmueble);
			session.setAttribute("detinmuebles", detinmuebles);
			if (detinmuebles.isEmpty()) {
				result="Vacio";
			}else{
			for (Map<String, Object> r : detinmuebles) {
				res+="<tr><td>"+r.get("idobligacion")+"</td>"
	    		+ "<td>"+r.get("idtobligacion")+"</td>"
	    				+ "<td>"+r.get("idinmueble")+"</td>"
	    						+ "<td>"+r.get("descripcion")+"</td>"
	    								+ "<td>"+r.get("anio")+"</td>"
	    										+ "<td>"+r.get("mes")+"</td>"
	    												+ "<td>"+r.get("importe")+"</td></tr>";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Inmueble</th><th>Piso</th><th>Numero</th><th>Descripcion</th>"
				    +"<th>Dueño</th><th>Tipo de inmueble</th><th>Torre</th></tr></thead><tbody>"+res+"</tbody></table>";
			}
			} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			result = "Error" + e.getMessage();
		}

		return result;

	}

	@RequestMapping(value = "eventos.htm", method = RequestMethod.GET)
	public String eventos() {
		return "eventos";
	}

	@RequestMapping(value = "salir.htm", method = RequestMethod.GET)
	public String salir(HttpSession session) {

		session.invalidate();

		return "index";

	}
	
	@RequestMapping(value="estadocuenta.htm", method=RequestMethod.GET)
	public String estadocuenta(){
		return "estadocuenta";
	}
	
	@RequestMapping(value="estadocuenta.htm", method=RequestMethod.POST)
	public String estadocuenta(@RequestParam("idpersona") int idpersona, HttpSession session,

			Model model) {

		String destino;
		
		try {
			List<Map<String, Object>> listadeudas;
			listadeudas = PersonaService.listaralldeudas(idpersona);
			session.setAttribute("listadeudas", listadeudas);

			destino = "estadocuenta";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			destino = "estadocuenta";
		}

		return destino;
	}
	
	@RequestMapping(value = "/recibos/listarecibos.htm", method = RequestMethod.GET)
	public @ResponseBody String listrecibos(HttpSession session,
			Model model) {
		String result = "", res="";

		try {
			List<Map<String, Object>> listrecibos;
			listrecibos = CondominioService.listarRecibos();
			session.setAttribute("listrecibos", listrecibos);
			if (listrecibos.isEmpty()) {
				result="Vacio";
			}else{
			for (Map<String, Object> r : listrecibos) {
				res+="<tr><td>"+r.get("idrecibo")+"</td>"
	    		+ "<td>"+r.get("nombre")+"</td>"
	    				+ "<td>"+r.get("codigo")+"</td>"
	    						+ "<td>"+r.get("anio")+"</td>"
	    								+ "<td>"+r.get("mes")+"</td>"
	    										+ "<td>"+r.get("fecVen")+"</td>"
	    												+ "<td>"+r.get("importe")+"</td></tr>";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Recibo</th><th>Nombre</th><th>Codigo</th><th>Año</th>"
				    +"<th>Mes</th><th>Fecha de Vencimiento</th><th>Importe</th></tr></thead><tbody>"+res+"</tbody></table>";
			}
			} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			result = "Error" + e.getMessage();
		}
		
		

		return result;

	}
	
	@RequestMapping(value="recibos.htm", method=RequestMethod.GET)
	public String recibos(){
		return "recibos";
	}

}
