package pe.egcc.carrito.model;

import java.util.ArrayList;
import java.util.List;

public class Carrito {
	
	private List<Item> lista;
	
	public Carrito() {
		lista = new ArrayList<>();
	}
	
	public void agregar(Item item){
		lista.add(item);
		generaIds();
	}
	
	private void generaIds(){
		for (int i = 0; i < lista.size(); i++) {
			lista.get(i).setId(i + 1);
		}
	}
	
	public List<Item> getLista() {
		return lista;
	}

}
