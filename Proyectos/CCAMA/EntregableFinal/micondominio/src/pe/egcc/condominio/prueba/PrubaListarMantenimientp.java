package pe.egcc.condominio.prueba;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.egcc.condominio.model.ObligacionModel;
import pe.egcc.condominio.service.ComboService;
import pe.egcc.condominio.service.ObligacionManteService;

public class PrubaListarMantenimientp {
	public static void main(String[] args) {
		
		String contexto = "/pe/egcc/condominio/prueba/contexto.xml";
		BeanFactory beanFactory;
		beanFactory = new ClassPathXmlApplicationContext(contexto);
		
		ObligacionManteService service;
	    service = beanFactory.getBean(ObligacionManteService.class);	    
	 
	    List<ObligacionModel> lista;
	    lista = service.leerObligaciones(2018, 1,1);	    
System.out.print("");
		    }
	}

