package pe.usil.condominio.service.impl;




import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;





@Service
public class Utilidad {
	
	public String convertirFecha(String fecha) {

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat output = new SimpleDateFormat("yyyy/MM/dd");
	    Date data=null;
		try {
			data = sdf.parse(fecha);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    String formattedTime = output.format(data);
	    return formattedTime;
	}
	

	
	
	

}
