package condominio.jeaguer.model;

public class Inmueble {
	
	private int idinmueble;
	private int piso;
	private int numero;
	private String descripcion;
	private int idpro;
	private int idtinmueble;
	private int idtorre;
	private int activo;
	
	public Inmueble() {
	}

	public int getIdinmueble() {
		return idinmueble;
	}

	public void setIdinmueble(int idinmueble) {
		this.idinmueble = idinmueble;
	}

	public int getPiso() {
		return piso;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getIdpro() {
		return idpro;
	}

	public void setIdpro(int idpro) {
		this.idpro = idpro;
	}

	public int getIdtinmueble() {
		return idtinmueble;
	}

	public void setIdtinmueble(int idtinmueble) {
		this.idtinmueble = idtinmueble;
	}

	public int getIdtorre() {
		return idtorre;
	}

	public void setIdtorre(int idtorre) {
		this.idtorre = idtorre;
	}

	public int getActivo() {
		return activo;
	}

	public void setActivo(int activo) {
		this.activo = activo;
	}

}
