package pe.egcc.carrito.model;

import java.util.ArrayList;
import java.util.List;

public class Carrito {
	
	private List<Item> lista;
	private double importe;
	private double impuesto;
	private double total;
	
	public Carrito() {
		lista = new ArrayList<>();
	}
	
	public void agregar(Item item){
		lista.add(item);
		item.setImporte(item.getPrecio() * item.getCant());
		generaIds();
		calcularTotales();
	}
	
	private void calcularTotales() {
		total = 0.0;
		for(Item item: lista){
			total += item.getImporte();
		}
		importe = total / 1.18;
		impuesto = total - importe;
	}

	private void generaIds(){
		for (int i = 0; i < lista.size(); i++) {
			lista.get(i).setId(i + 1);
		}
	}
	
	public List<Item> getLista() {
		return lista;
	}
	
	public double getImporte() {
		return importe;
	}
	
	public double getImpuesto() {
		return impuesto;
	}
	
	public double getTotal() {
		return total;
	}

}
