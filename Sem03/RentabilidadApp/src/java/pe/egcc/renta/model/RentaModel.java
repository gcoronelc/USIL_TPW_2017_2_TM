package pe.egcc.renta.model;

public class RentaModel {

  // Input
  private String curso; // Nombre del curso
  private double precio; // Precio del curso
  private int horas; // Horas de duración
  private int cantAlu; // Cantidad Alumnos
  private double pagoHora; // Pago por Hora al Profesor

  // Output
  private double ingresos; // Ingresos totales
  private double gastos; // Gastos totales
  private double renta; // Rentabilidad

  public RentaModel() {
  }

  public RentaModel(String curso, double precio, int horas, int cantAlu, double pagoHora) {
    this.curso = curso;
    this.precio = precio;
    this.horas = horas;
    this.cantAlu = cantAlu;
    this.pagoHora = pagoHora;
  }

  public String getCurso() {
    return curso;
  }

  public void setCurso(String curso) {
    this.curso = curso;
  }

  public double getPrecio() {
    return precio;
  }

  public void setPrecio(double precio) {
    this.precio = precio;
  }

  public int getHoras() {
    return horas;
  }

  public void setHoras(int horas) {
    this.horas = horas;
  }

  public int getCantAlu() {
    return cantAlu;
  }

  public void setCantAlu(int cantAlu) {
    this.cantAlu = cantAlu;
  }

  public double getPagoHora() {
    return pagoHora;
  }

  public void setPagoHora(double pagoHora) {
    this.pagoHora = pagoHora;
  }

  public double getIngresos() {
    return ingresos;
  }

  public void setIngresos(double ingresos) {
    this.ingresos = ingresos;
  }

  public double getGastos() {
    return gastos;
  }

  public void setGastos(double gastos) {
    this.gastos = gastos;
  }

  public double getRenta() {
    return renta;
  }

  public void setRenta(double renta) {
    this.renta = renta;
  }

}
