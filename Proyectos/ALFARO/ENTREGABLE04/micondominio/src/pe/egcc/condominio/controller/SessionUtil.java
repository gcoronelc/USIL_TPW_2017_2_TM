package pe.egcc.condominio.controller;

import javax.servlet.http.HttpSession;

public final class SessionUtil {
	
	public SessionUtil() {
	}
	
	 public static void set(HttpSession session, 
		      String key, Object value){
		    session.setAttribute(key, value);
	}
		  
    public static Object get(HttpSession session, String key){
		   return session.getAttribute(key);        
    }

}
