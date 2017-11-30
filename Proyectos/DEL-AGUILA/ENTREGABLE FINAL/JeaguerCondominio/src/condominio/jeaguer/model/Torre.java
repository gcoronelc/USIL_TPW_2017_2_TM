package condominio.jeaguer.model;

import org.springframework.jdbc.core.PreparedStatementSetter;

public class Torre {

	private int idtorre;
	private String nombre;

	public int getIdtorre() {
		return idtorre;
	}

	public void setIdtorre(int idtorre) {
		this.idtorre = idtorre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Torre() {
	}

	public Object[] toArrayInsert() {
		Object[] rowData= {nombre};
		return rowData;
	}
	

}
