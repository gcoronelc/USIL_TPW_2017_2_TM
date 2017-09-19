package pe.egcc.carrito.prueba;

import pe.egcc.carrito.model.Carrito;
import pe.egcc.carrito.model.Item;

public class Prueba01 {

	public static void main(String[] args) {

		Carrito carrito = new Carrito();

		carrito.agregar(new Item("Camisa", 95.0, 3));
		carrito.agregar(new Item("Pantalon", 145.0, 2));
		carrito.agregar(new Item("Casaca", 335.0, 1));

		for (Item item : carrito.getLista()) {
			System.out.println(item.getId() + " - " 
					+ item.getProducto() + " - " 
					+ item.getPrecio() + " - "
					+ item.getCant() + " - " 
					+ item.getImporte()

			);

		}

	}
}
