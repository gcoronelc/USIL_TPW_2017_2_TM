package condominio.jeaguer.model;

import org.springframework.jdbc.core.PreparedStatementSetter;

public class AlquilerAuditorio {

	private int idalquiler;
	private int idinmueble;
	private int idpro;
	private String fechainicio;
	private String fechafin;
	private double costo;
	private int pagado;
	private int limpieza;
	private double costolimpieza;
	private double total;
	
	public AlquilerAuditorio() {

	}

	public int getIdalquiler() {
		return idalquiler;
	}

	public void setIdalquiler(int idalquiler) {
		this.idalquiler = idalquiler;
	}

	public int getIdinmueble() {
		return idinmueble;
	}

	public void setIdinmueble(int idinmueble) {
		this.idinmueble = idinmueble;
	}
	
	

	public int getIdpro() {
		return idpro;
	}

	public void setIdpro(int idpro) {
		this.idpro = idpro;
	}

	public String getFechainicio() {
		return fechainicio;
	}

	public void setFechainicio(String fechainicio) {
		this.fechainicio = fechainicio;
	}

	public String getFechafin() {
		return fechafin;
	}

	public void setFechafin(String fechafin) {
		this.fechafin = fechafin;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}

	public int getPagado() {
		return pagado;
	}

	public void setPagado(int pagado) {
		this.pagado = pagado;
	}

	public int getLimpieza() {
		return limpieza;
	}

	public void setLimpieza(int limpieza) {
		this.limpieza = limpieza;
	}

	public double getCostolimpieza() {
		return costolimpieza;
	}

	public void setCostolimpieza(double costolimpieza) {
		this.costolimpieza = costolimpieza;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Object[] toArrayInsert() {
		Object[] rowData= {idinmueble,idpro,fechainicio,fechafin,costo,pagado,limpieza,costolimpieza,total};
		return rowData;
	}
	

	
}
