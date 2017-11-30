package condominio.jeaguer.model;

import org.springframework.jdbc.core.PreparedStatementSetter;

public class Recibo {
	
	private int idrecibo;
	private int idtobligacion;
	private String codigo;
	private int anio;
	private int mes;
	private String fecVen;
	private double importe;
	
	public int getIdrecibo() {
		return idrecibo;
	}
	public void setIdrecibo(int idrecibo) {
		this.idrecibo = idrecibo;
	}
	public int getIdtobligacion() {
		return idtobligacion;
	}
	public void setIdtobligacion(int idtobligacion) {
		this.idtobligacion = idtobligacion;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
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
	public String getFecVen() {
		return fecVen;
	}
	public void setFecVen(String fecVen) {
		this.fecVen = fecVen;
	}
	public double getImporte() {
		return importe;
	}
	public void setImporte(double importe) {
		this.importe = importe;
	}
	public Object[] toArrayInsert() {
		Object[] rowdata = {idtobligacion,codigo,anio,mes,fecVen,importe}; 
		return rowdata;
	}
}
