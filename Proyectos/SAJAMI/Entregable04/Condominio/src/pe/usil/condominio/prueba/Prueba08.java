package pe.usil.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.usil.condominio.model.Persona;
import pe.usil.condominio.model.Recibo;
import pe.usil.condominio.service.espec.CondominioServiceEspec;
import pe.usil.condominio.service.impl.CondominioService;
import pe.usil.condominio.service.impl.PersonaService;

public class Prueba08 {
	
public static void main(String[] args){
		
		// Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);
	    CondominioServiceEspec service;
	    String mensaje="";
	    int id=2, idtobligacion=0;
	    service = beanFactory.getBean(CondominioServiceEspec.class);
		List<Map<String,Object>> lista;
		try {
			
			lista=service.listarRecibosxid(id);
			if(lista.isEmpty()){
				mensaje="Obligacion ya creada";
				
			}else{
				for (Map<String,Object> r : lista) {
					idtobligacion=Integer.parseInt(""+r.get("idtobligacion"));
				}
				switch (idtobligacion) {
				case 1:
					mensaje="Metodo aun no implementado mant";
					break;
				case 2:
					service.registrarObligacionAgua(id);
					mensaje="Registro de obligacion correcto";
					break;
				case 3:
					mensaje="Metodo aun no implementado other";
					break;

				default:
					break;
				}
			}
			
			
			
			
			System.out.println(idtobligacion);
			System.out.println(mensaje);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		}
	    
	    
		    
	 // Reporte

	  }

}
