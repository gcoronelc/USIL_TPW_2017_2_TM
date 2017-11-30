package condominio.jeaguer.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import condominio.jeaguer.model.Administrador;
import condominio.jeaguer.model.AlquilerAuditorio;
import condominio.jeaguer.model.Inmueble;
import condominio.jeaguer.model.Inquilino;
import condominio.jeaguer.model.Propietario;
import condominio.jeaguer.model.Recibo;
import condominio.jeaguer.model.TInmueble;
import condominio.jeaguer.model.Torre;
import condominio.jeaguer.service.PropietarioService;
import condominio.jeaguer.service.ReciboService;
import condominio.jeaguer.service.TorreService;
import condominio.jeaguer.service.AlquilerAudiService;
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
	@Autowired
	private AlquilerAudiService alquilerAudiService;
	@Autowired
	private ReciboService reciboService;

	@RequestMapping(value = "index.htm", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "propietario.htm", method = RequestMethod.GET)
	public String propietario() {
		return "propietario";
	}
	
	@RequestMapping(value = "listarecibos.htm", method = RequestMethod.GET)
	public String listarecibos(Model model) {
		
		List<Map<String, Object>> lista;
		lista=reciboService.listarRecibo();
		model.addAttribute("lista", lista);
		
		return "listarecibos";
	}
	

	@RequestMapping(value = "registrorecibo.htm", method = RequestMethod.GET)
	public String registrorecibo() {
		return "registrorecibo";
	}
	
	@RequestMapping(value = "registroinmueble.htm", method = RequestMethod.GET)
	public String registroinmueble(Model  model) {
		
		List<TInmueble> lista=inmuebleService.combotiInmueble();
		model.addAttribute("lista",lista);
		List<Torre> listatorre=inmuebleService.comboTorre();
		model.addAttribute("listatorre",listatorre);
		List<Propietario> listapro=alquilerAudiService.listapropie();
		model.addAttribute("listapro",listapro);	
		return "registroinmueble";
	}
	
	@RequestMapping(value = "registraralquiler.htm", method = RequestMethod.GET)
	public String registraralquiler(Model model) {
		
		try {
			List<Inmueble> lista=alquilerAudiService.listaAuditorios();
			model.addAttribute("lista",lista);
			
			List<Propietario> listapro=alquilerAudiService.listapropie();
			model.addAttribute("listapro",listapro);
			
		} catch (Exception e) {
			model.addAttribute("error", "No hay auditorios");
		}
		
		return "registraralquiler";
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
		
		String destino;
		
		Propietario bean = loginService.validarIngreso(usuario, clave);
		Administrador beana = loginService.validarLogin(usuario, clave);
		
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
	
	
	@RequestMapping(value = "registrarAlquiler.htm", method = RequestMethod.POST)
	public String registrarAlquiler
	(@RequestParam("auditorio") int auditorio,
	 @RequestParam("propietarios") int propietarios,
	 @RequestParam("fechainicio") String fechainicio,
	 @RequestParam("fechafin") String fechafin,
	 @RequestParam("costo") double costo,
	 @RequestParam("pagado") int pagado,
	 @RequestParam("limpieza") int limpieza,
		Model model	)
	{
		try {
			double costolimpieza;
			if(limpieza==1){
				 costolimpieza=0.00;
			}else{
				 costolimpieza=120.00;
			}
			
			AlquilerAuditorio bean = new AlquilerAuditorio();
			bean.setIdinmueble(auditorio);
			bean.setIdpro(propietarios);
			bean.setFechainicio(fechainicio);
			bean.setFechafin(fechafin);
			bean.setCosto(costo);
			bean.setPagado(pagado);
			bean.setLimpieza(limpieza);
			bean.setCostolimpieza(costolimpieza);
			bean.setTotal(bean.getCosto()+bean.getCostolimpieza());
			alquilerAudiService.registrarAlquiler(bean);

			model.addAttribute("mensaje", "Se registro el alquiler");
			
		} catch (Exception e) {
			model.addAttribute("mensaje", "Error al momento de registrar");
		}
		return "registraralquiler";
	}

	@RequestMapping(value = "registroinmueble.htm", method = RequestMethod.POST)
	public String registroinmueble
	(@RequestParam("piso") int piso,
	 @RequestParam("numero") int numero,
	 @RequestParam("descripcion") String descripcion,
	 @RequestParam("idpro") int idpro,
	 @RequestParam("idtinmueble") int idtinmueble,
	 @RequestParam("idtorre") int idtorre,
		Model model	)
	{
		try {
			Inmueble bean = new Inmueble();
			bean.setPiso(piso);
			bean.setNumero(numero);
			bean.setDescripcion(descripcion);
			bean.setIdpro(idpro);
			bean.setIdtinmueble(idtinmueble);
			bean.setIdtorre(idtorre);
			bean.setActivo(1);
			inmuebleService.registrarInmueble(bean);

			model.addAttribute("mensaje", "Se registro el inmueble");
			
		} catch (Exception e) {
			model.addAttribute("mensaje", "Error al momento de registrar");
		}
		return "registroinmueble";
	}
	
	
	@RequestMapping(value = "registrorecibo.htm", method = RequestMethod.POST)
	public String registrarrecibo
	(@RequestParam("codigo") String codigo,
	@RequestParam("anio")  int anio,
	@RequestParam("mes") int mes,
	@RequestParam("fvence")String fvence,
	@RequestParam("importe") double importe,
	Model model
			) 
	{
		try {
			Recibo bean = new Recibo();
			bean.setIdtobligacion(1);
			bean.setCodigo(codigo);
			bean.setAnio(anio);
			bean.setMes(mes);
			bean.setFecVen(fvence);
			bean.setImporte(importe);
			reciboService.registrarRecibo(bean);
			model.addAttribute("mensaje", "Se registro el recibo");
		} catch (Exception e) {
			model.addAttribute("mensaje", "Error al momento de registrar");
		}
	
		return "registrorecibo";
	}

	
}
