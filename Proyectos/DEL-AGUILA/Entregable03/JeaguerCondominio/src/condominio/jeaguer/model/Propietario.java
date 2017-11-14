package condominio.jeaguer.model;

import org.springframework.jdbc.core.PreparedStatementSetter;

public class Propietario {

	private int idpro;             
	private String apellido;             
	private String nombre;
	private String dni    ;              
	private String email   ;             
	private String telefono ;            
	private String usuario;
	private String clave ;
	private int estado;
	

	
	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	
	
	public Propietario() {
	}

	public int getIdpro() {
		return idpro;
	}

	public void setIdpro(int idpro) {
		this.idpro = idpro;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public Object[] toArrayInsert() {
		Object[] rowData= {apellido,nombre,dni,email,telefono,usuario,clave,estado};
		return rowData;
	}
	
	
	
}
