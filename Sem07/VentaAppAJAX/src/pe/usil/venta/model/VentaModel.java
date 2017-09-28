package pe.usil.venta.model;

public class VentaModel {

  // Input
  private double precio;
  private int cant;
  // Output
  private double importe;
  private double impuesto;
  private double total;

  public VentaModel() {
  }

  public VentaModel(double precio, int cant) {
    super();
    this.precio = precio;
    this.cant = cant;
  }

  public double getPrecio() {
    return precio;
  }

  public void setPrecio(double precio) {
    this.precio = precio;
  }

  public int getCant() {
    return cant;
  }

  public void setCant(int cant) {
    this.cant = cant;
  }

  public double getImporte() {
    return importe;
  }

  public void setImporte(double importe) {
    this.importe = importe;
  }

  public double getImpuesto() {
    return impuesto;
  }

  public void setImpuesto(double impuesto) {
    this.impuesto = impuesto;
  }

  public double getTotal() {
    return total;
  }

  public void setTotal(double total) {
    this.total = total;
  }

}
