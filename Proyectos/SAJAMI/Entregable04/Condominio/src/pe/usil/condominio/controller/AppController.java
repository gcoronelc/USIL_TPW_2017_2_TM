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

import com.google.gson.Gson;

import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import pe.usil.condominio.model.DetInmueble;
import pe.usil.condominio.model.Persona;
import pe.usil.condominio.model.Recibo;
import pe.usil.condominio.service.espec.CondominioServiceEspec;
import pe.usil.condominio.service.espec.InmuebleServiceEspec;
import pe.usil.condominio.service.espec.PersonaServiceEspec;
import pe.usil.condominio.service.impl.Utilidad;

@Controller
public class AppController {

	@Autowired
	private PersonaServiceEspec PersonaService;

	@Autowired
	private InmuebleServiceEspec InmuebleService;
	
	@Autowired
	private CondominioServiceEspec CondominioService;
	
	@Autowired
	private Utilidad utilidad;

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
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr>"
					+ "<th>Id Obligacion</th><th>Tipo Obligacion</th><th>IdInmueble</th><th>Descripcion</th>"
				    +"<th>Año</th><th>Mes</th><th>Importe</th></tr></thead>"
				    + "<tbody>"+res+"</tbody></table>";
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
				res+="<tr><td id='cod"+r.get("idrecibo")+"'>"+r.get("idrecibo")+"</td>"
	    		+ "<td>"+r.get("nombre")+"</td>"
	    				+ "<td>"+r.get("codigo")+"</td>"
	    						+ "<td>"+r.get("anio")+"</td>"
	    								+ "<td>"+r.get("mes")+"</td>"
	    										+ "<td>"+r.get("fecVen")+"</td>"
	    												+ "<td>"+r.get("importe")+"</td>"
	    														+ "<td><button "
	    														+ "class='btn btn-warning' "
	    														+ "onclick='creaObligacion(cod"+r.get("idrecibo")+")'>Obligacion</button></td></tr>";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Recibo</th><th>Nombre</th><th>Codigo</th><th>Año</th>"
				    +"<th>Mes</th><th>Fecha de Vencimiento</th><th>Importe</th><th>Accion</th></tr></thead><tbody>"+res+"</tbody></table>";
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
	
	@RequestMapping( value="/recibos/cargacombos.htm", 
		      method=RequestMethod.GET,
		      produces="application/json")  
		  public @ResponseBody String cargaCombos(){

		    List<Map<String,Object>> lista;
		    
		    lista = CondominioService.listarTiposObligacion();
		    
		    Gson gson = new Gson();
		    String jsonResponse = gson.toJson(lista);
		    
		    return jsonResponse;
		  }
	
	
	@RequestMapping(value="/recibos/regRecibos.htm", method=RequestMethod.POST)
	public @ResponseBody String  registrarRecibo(
			@RequestParam("combotipo")int tipo,
			@RequestParam("codigo")String codigo,
			@RequestParam("anio")int anio,
			@RequestParam("mes")int mes,
			@RequestParam("fecv")String fecv,
			@RequestParam("importe")double importe,
			@ModelAttribute Recibo recibo
			){
		String result="";
		String fechav=utilidad.convertirFecha(fecv);
		Recibo bean= new Recibo();
		bean.setIdtobligacion(tipo);
		bean.setCodigo(codigo);
		bean.setAnio(anio);
		bean.setMes(mes);
		bean.setFecha(fechav);
		bean.setImporte(importe);
			
		try {
			
			recibo = CondominioService.registrarRecibo(bean);
			result="";
			
		} catch (Exception e) {
			result="Error";
		}
		
		
		return result;
	}
	
	@RequestMapping(value="personas.htm", method=RequestMethod.GET)
	public String personas(){
		return "personas";
	}
	
	@RequestMapping( value="/personas/cargacombos.htm", 
		      method=RequestMethod.GET,
		      produces="application/json")  
		  public @ResponseBody String cargaCombosP(){

		    List<Map<String,Object>> lista;
		    
		    lista = PersonaService.listartipopersonas();
		    
		    Gson gson = new Gson();
		    String jsonResponse = gson.toJson(lista);
		    
		    return jsonResponse;
		  }
	
	@RequestMapping(value = "/personas/listapersonas.htm", method = RequestMethod.GET)
	public @ResponseBody String listPersonas(HttpSession session,
			Model model) {
		String result = "", res="";

		try {
			List<Map<String, Object>> listpersonas;
			listpersonas = PersonaService.listarPersonas();
			session.setAttribute("listpersonas", listpersonas);
			if (listpersonas.isEmpty()) {
				result="Vacio";
			}else{
			for (Map<String, Object> r : listpersonas) {
				res+="<tr><td id='id"+r.get("idpersona")+"' >"+r.get("idpersona")+"</td>"
	    		+ "<td>"+r.get("apellido")+"</td>"
	    				+ "<td>"+r.get("nombre")+"</td>"
	    						+ "<td>"+r.get("nomtipo")+"</td>"
	    								+ "<td>"+r.get("dni")+"</td>"
	    										+ "<td>"+r.get("email")+"</td>"
	    											+ "<td>"+r.get("telefono")+"</td>"
	    												+ "<td>"+r.get("direccion")+"</td>"
	    														+ "<td><button data-toggle='modal' "
	    														+ "data-target='#ModalEdit'><i class='fa fa-pencil'></i></button>"
	    														+ "<button onclick='eliminarpersona(id"+r.get("idpersona")+");'><i class='fa fa-trash'></i></button></td></tr>";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Persona</th><th>Apellido</th><th>Nombre</th><th>Tipo</th>"
				    +"<th>DNI</th><th>Email</th><th>Telefono</th><th>Direccion</th><th>Accion</th></tr></thead><tbody>"+res+"</tbody></table>";
			}
			} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			result = "Error" + e.getMessage();
		}
		
		

		return result;
	}
	
	@RequestMapping(value="/personas/regPersonas.htm", method=RequestMethod.POST)
	public @ResponseBody String  registrarPersona(
			@RequestParam("combotipo")int tipo,
			@RequestParam("ape")String ape,
			@RequestParam("nom")String nom,
			@RequestParam("dni")String dni,
			@RequestParam("email")String email,
			@RequestParam("telef")String telef,
			@RequestParam("dir")String dir,
			@ModelAttribute Persona persona
			){
		String result="";
		Persona bean= new Persona();
		bean.setIdtpersona(tipo);
		bean.setApellido(ape);
		bean.setNombre(nom);
		bean.setDni(dni);
		bean.setEmail(email);
		bean.setTelefono(telef);
		bean.setDireccion(dir);
		bean.setEstado(1);
		
			
		try {
			
			persona = PersonaService.registrarPersona(bean);
			result=String.valueOf(persona.getIdpersona());
			
		} catch (Exception e) {
			result="Error";
		}
		
		
		return result;
	}
	
	
	@RequestMapping(value="/recibos/regObligacion.htm", method=RequestMethod.POST)
	public @ResponseBody String  registrarObligacion(
			@RequestParam("id")int id
			){
		String result="";
		int idtobligacion=0;
		
		List<Map<String,Object>> lista;
		try {
			
			lista=CondominioService.listarRecibosxid(id);
			if(lista.isEmpty()){
				result="Obligacion ya creada";
				
			}else{
				for (Map<String,Object> r : lista) {
					idtobligacion=Integer.parseInt(""+r.get("idtobligacion"));
				}
				switch (idtobligacion) {
				case 1:
					result="Metodo aun no implementado mant";
					break;
				case 2:
					CondominioService.registrarObligacionAgua(id);
					result="Registro de obligacion correcto";
					break;
				case 3:
					result="Metodo aun no implementado other";
					break;

				}
			}
			
			
			
			
		} catch (Exception e) {
			
			result="Error." +e.getMessage();

		}
		
		return result;
	}
	


	@RequestMapping(value = "/eventos/listaeventos.htm", method = RequestMethod.GET)
	public @ResponseBody String listaEventos(@RequestParam("id") int id,
			HttpSession session,
			Model model) {
		String result = "", res="";

		try {
			List<Map<String, Object>> listaeventos;
			listaeventos = CondominioService.listarEventos(id);
			session.setAttribute("listaeventos", listaeventos);
			if (listaeventos.isEmpty()) {
				result="No ha registrado ningun evento hasta el momento";
			}else{
			for (Map<String, Object> r : listaeventos) {
				res+="<tr><td>"+r.get("Descripcion")+"</td>"
	    		+ "<td>"+r.get("Importe")+"</td>"
	    				+ "<td>"+r.get("FechaPedido")+"</td>"
	    						+ "<td>"+r.get("FechaReserva")+"</td></tr>";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'>"
					+ "<tr><th>Descripcion</th><th>Importe</th><th>FechaPedido</th>"
					+ "<th>FechaReserva</th>"
				    +"</tr></thead><tbody>"+res+"</tbody></table>";
			}
			} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			result = "Error" + e.getMessage();
		}
		
		return result;
	}
	
	
	@RequestMapping(value="/eventos/regEventos.htm", method=RequestMethod.POST)
	public @ResponseBody String  registrarEvento(
			@RequestParam("id")int id,
			@RequestParam("fecr")String fecha,
			@RequestParam("descr")String descr,
			@RequestParam("limpieza")int limp,
			HttpSession session
			){
		String result="";
		
		String fechare=utilidad.convertirFecha(fecha);
			
		try {
			
			//Comprobar disponibilidad
			List<Map<String, Object>> compruebafecha;
			compruebafecha=CondominioService.compruebadisponibilidadAu(fechare);
			session.setAttribute("compruebafecha", compruebafecha);
			if (compruebafecha.isEmpty()) {
				CondominioService.registraEvento(id, fechare, descr, limp);
				result="Registro Exitoso";
			}else{
				result="Error, Fecha no disponible";
			}
			

			
		} catch (Exception e) {
			result="Error. "+e.getMessage();
		}
		
		
		return result;
	}
	
	@RequestMapping(value="/eventos/compruebaFecha.htm", method=RequestMethod.POST)
	public @ResponseBody String  compruebaFecha(
			@RequestParam("fecha")String fecha,
			HttpSession session
			){
		String result="";
		
		String fechare=utilidad.convertirFecha(fecha);
			
		try {
			List<Map<String, Object>> compruebafecha;
			compruebafecha=CondominioService.compruebadisponibilidadAu(fechare);
			session.setAttribute("compruebafecha", compruebafecha);
			if (compruebafecha.isEmpty()) {
				result="Fecha disponible";
			}else{
				result="Fecha no disponible";
			}
			
			
			
		} catch (Exception e) {
			result="Error";
		}
		
		
		return result;
	}
	
	@RequestMapping(value="/personas/eliminarPersonas.htm", method=RequestMethod.POST)
	public @ResponseBody String  eliminarPersonas(
			@RequestParam("id")int id
			){
		String result="";
		

		try {
			PersonaService.eliminarPersona(id);
			result="La persona ha sido eliminada correctamente";
			
			
		} catch (Exception e) {
			result=""+e.getMessage();
		}
		
		
		return result;
	}
	
	@RequestMapping(value="/personas/traerDatos.htm", method=RequestMethod.POST)
	public @ResponseBody String  traerDatos(
			@RequestParam("id")int id
			){
		String result="", res="";
		

		try {
			List<Map<String, Object>> listpersonas;
			listpersonas = PersonaService.listarPersonaxID(id);
			
			for (Map<String, Object> r : listpersonas) {
				res+="";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Persona</th><th>Apellido</th><th>Nombre</th><th>Tipo</th>"
				    +"<th>DNI</th><th>Email</th><th>Telefono</th><th>Direccion</th><th>Accion</th></tr></thead><tbody>"+res+"</tbody></table>";
			
			} catch (Exception e) {
			
			result = "Error" + e.getMessage();
		}
		
		return result;
	}
	
	@RequestMapping(value = "inmueblesadmi.htm", method = RequestMethod.GET)
	public String inmueblesadmi() {
		return "inmueblesadmi";
	}
	
	@RequestMapping(value = "/inmueblesadmi/listainmuebles.htm", method = RequestMethod.GET)
	public @ResponseBody String listinmueblesall(HttpSession session,
			Model model) {
		String result = "", res="";

		try {
			List<Map<String, Object>> listainmuebles;
			listainmuebles = InmuebleService.listartodoinmueble();
			session.setAttribute("listainmuebles", listainmuebles);
			if (listainmuebles.isEmpty()) {
				result="Vacio";
			}else{
			for (Map<String, Object> r : listainmuebles) {
				res+="<tr><td>"+r.get("inmueble")+"</td>"
	    		+ "<td>"+r.get("tipo")+"</td>"
	    				+ "<td>"+r.get("nomtipo")+"</td>"
	    						+ "<td>"+r.get("torre")+"</td>"
	    								+ "<td>"+r.get("nomtorre")+"</td>"
	    										+ "<td>"+r.get("piso")+"</td>"
	    												+ "<td>"+r.get("numero")+"</td>"
	    														+ "<td>"+r.get("descripcion")+"</td>"
	    														
	    												+ "<td>"+r.get("propietario")+"</td></tr>";	
			}
			
			result="<table class='table table-responsive'><thead class='thead-default'><tr><th>Id Inmueble</th><th>Tipo</th><th>Nombre Tipo</th><th>Torre</th>"
				    +"<th>Nombre Torre</th><th>Piso</th><th>Numero</th><th>Descripcion</th><th>Propietario</th></tr></thead><tbody>"+res+"</tbody></table>";
			}
			} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			result = "Error" + e.getMessage();
		}
		
		

		return result;

	}
	
}
