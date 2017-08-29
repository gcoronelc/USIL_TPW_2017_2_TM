package pe.egcc.renta.prueba;

import pe.egcc.renta.model.RentaModel;
import pe.egcc.renta.service.RentaService;

public class Prueba01 {

  public static void main(String[] args) {
    // Dato
    RentaModel bean = new RentaModel("Spring", 500.0, 30, 20, 150.0);
    // Proceso
    RentaService service = new RentaService();
    bean = service.procesarRenta(bean);
    // Renta
    System.out.println("Ingresos: " + bean.getIngresos());
    System.out.println("Gastos: " + bean.getGastos());
    System.out.println("Renta: " + bean.getRenta());
  }
  
}
