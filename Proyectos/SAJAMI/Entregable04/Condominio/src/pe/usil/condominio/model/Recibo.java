package pe.usil.condominio.model;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.web.bind.annotation.RequestMapping;

public class Recibo {
	
	private int idrecibo;
	private int idtobligacion;
	private String codigo;
	private int anio;
	private int mes;
	private String fecha;
	private double importe;
	
	public Recibo(){
		
	}
	
	

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

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}
	
	
	public Object[] toArrayInsert(){
		Object[] rowData= {idtobligacion,codigo,anio,mes,fecha,importe};
		return rowData;
	}

	
}
