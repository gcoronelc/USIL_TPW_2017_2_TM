package pe.egcc.condominio.model;

public class Inmueble {

	private Integer idinmueble;
	private Integer piso;
	private Integer numero;
	private String descripcion;
	private Integer idpersona;
	private Integer idtinmueble;
	private Integer idtorre;
	private Integer activo;
	
	
	public Inmueble(){}

	public Integer getIdinmueble() {
		return idinmueble;
	}

	public void setIdinmueble(Integer idinmueble) {
		this.idinmueble = idinmueble;
	}

	public Integer getPiso() {
		return piso;
	}

	public void setPiso(Integer piso) {
		this.piso = piso;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getIdpersona() {
		return idpersona;
	}

	public void setIdpersona(Integer idpersona) {
		this.idpersona = idpersona;
	}

	public Integer getIdtinmueble() {
		return idtinmueble;
	}

	public void setIdtinmueble(Integer idtinmueble) {
		this.idtinmueble = idtinmueble;
	}

	public Integer getIdtorre() {
		return idtorre;
	}

	public void setIdtorre(Integer idtorre) {
		this.idtorre = idtorre;
	}

	public Integer getActivo() {
		return activo;
	}

	public void setActivo(Integer activo) {
		this.activo = activo;
	}
}
