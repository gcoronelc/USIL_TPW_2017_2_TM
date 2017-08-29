package pe.egcc.renta.service;

import org.springframework.stereotype.Service;
import pe.egcc.renta.model.RentaModel;

@Service
public class RentaService {
  
  public RentaModel procesarRenta(RentaModel bean){
    // Variables Principales
    double ingresos, gastos, renta;
    // Procesar
    ingresos = bean.getPrecio() * bean.getCantAlu();
    double pagoProf = bean.getHoras() * bean.getPagoHora();
    double gasPub = ingresos * 0.08;
    double gasAdm = ingresos * 0.05;
    double gasMat = ingresos * 0.06;
    gastos = pagoProf + gasPub + gasAdm + gasMat;
    renta = ingresos - gastos;
    // Reportes
    bean.setIngresos(ingresos);
    bean.setGastos(gastos);
    bean.setRenta(renta);
    return bean;
  }
  
}
