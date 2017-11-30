package pe.usil.condominio.prueba;

import java.text.ParseException;

import pe.usil.condominio.service.impl.Utilidad;

public class PruebaFecha {
	
	 public static void main(String[] args) throws ParseException {
		 
		 Utilidad service = new Utilidad();
		 
		 String fec="20-12-2017";
		 System.out.println(service.convertirFecha(fec));
		 
		 
	 }
	 

}
