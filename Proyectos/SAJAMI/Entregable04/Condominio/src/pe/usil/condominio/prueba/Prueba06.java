package pe.usil.condominio.prueba;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import pe.usil.condominio.model.Recibo;
import pe.usil.condominio.service.espec.CondominioServiceEspec;
import pe.usil.condominio.service.impl.CondominioService;
import pe.usil.condominio.service.impl.Utilidad;

public class Prueba06 {
public static void main(String[] args){
		
		// Instanciando el contexto
	    String contexto = "/pe/usil/condominio/prueba/contexto.xml";
	    BeanFactory beanFactory;
	    beanFactory = new ClassPathXmlApplicationContext(contexto);
	    CondominioService service;
		try {
			service = beanFactory.getBean(CondominioService.class);
			Recibo bean = new Recibo();
			bean.setIdtobligacion(2);
			bean.setCodigo("pruebac");
			bean.setAnio(2017);
			bean.setMes(12);
			bean.setFecha("2017/12/11");
			bean.setImporte(123.30);
			service.registrarRecibo(bean);
			System.out.println("Registro Ok");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	    
	    
		    
	 // Reporte

	  }
}
