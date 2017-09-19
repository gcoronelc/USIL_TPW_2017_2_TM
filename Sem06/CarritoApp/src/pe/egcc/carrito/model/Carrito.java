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

	public void agregar(Item item) {
	  Item itemx = null;
	  // Buscar item
	  for(Item i: lista){
	    if(i.getProducto().equals(item.getProducto())){
	      itemx = i;
	      break;
	    }
	  }
	  // Si no lo encuentra es nuevo, sino se actualiza
	  if( itemx == null){
	    lista.add(item);
	    itemx = item;
	  } else {
	    itemx.setCant(itemx.getCant() + item.getCant());
	    itemx.setPrecio(Math.min(itemx.getPrecio(), item.getPrecio()));
	  }
		itemx.setImporte(itemx.getPrecio() * itemx.getCant());
		generaIds();
		calcularTotales();
	}

	private void calcularTotales() {
		total = 0.0;
		for (Item item : lista) {
			total += item.getImporte();
		}
		importe = total / 1.18;
		impuesto = total - importe;
	}

	private void generaIds() {
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

	public void eliminar(int id) {
	  for(Item item: lista){
	    if(item.getId() == id){
	      lista.remove(item);
	      break;
	    }
	  }
	  generaIds();
    calcularTotales();
	}

  public void reset() {
    lista.clear();
    this.importe = 0.0;
    this.impuesto = 0.0;
    this.total = 0.0;
  }

}
