package condominio.jeaguer.model;

public class Inquilino {
	private int idinquilino;
	private int idinmueble;
	private String apellido;
	private String nombre;
	private String dni;
	private String email;
	private String telefono;
	private int estado;

	public Inquilino() {

	}

	public int getIdinquilino() {
		return idinquilino;
	}

	public void setIdinquilino(int idinquilino) {
		this.idinquilino = idinquilino;
	}

	public int getIdinmueble() {
		return idinmueble;
	}

	public void setIdinmueble(int idinmueble) {
		this.idinmueble = idinmueble;
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

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	public Object[] toArrayInsert() {
		Object[] rowdata = {idinmueble, apellido, nombre, dni, email, telefono, estado};
		return rowdata;
	}

}
