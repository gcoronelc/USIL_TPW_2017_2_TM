package pe.usil.condominio.model;

public class DetInmueble {
	
	private int idobligacion;
	private int idtobligacion;
	private int idinmueble;
	private String descripcion;
	private int anio;
	private int mes;
	private double importe;
	
	public DetInmueble(){
		
	}

	public int getIdobligacion() {
		return idobligacion;
	}

	public void setIdobligacion(int idobligacion) {
		this.idobligacion = idobligacion;
	}

	public int getIdtobligacion() {
		return idtobligacion;
	}

	public void setIdtobligacion(int idtobligacion) {
		this.idtobligacion = idtobligacion;
	}

	public int getIdinmueble() {
		return idinmueble;
	}

	public void setIdinmueble(int idinmueble) {
		this.idinmueble = idinmueble;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getAnio() {
		return anio;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}

	public int getMes() {
		return mes;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

	
}
