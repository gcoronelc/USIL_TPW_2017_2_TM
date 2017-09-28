/*
	El objeto venta tiene las siguientes propiedades.
	IMPUT:
	  - precio
	  - cant
	OUTPUT
	  - importe
	  - impuesto
	  - total
*/
function procesarVenta( ventaModel ){
	// Proceso
	var total = ventaModel.precio * ventaModel.cant;
	var importe = total / 1.18;
	var impuesto = total - importe;
	// Reporte
	ventaModel.importe = importe;
	ventaModel.impuesto = impuesto;
	ventaModel.total = total;
	// Retorno
	return ventaModel;
}

// Prueba - Datos
//ventaModel = {"precio":580.0,"cant":5,"importe":0,"impuesto":0,"total":0};
// Proceso
//ventaModel = procesarVenta(ventaModel);
// Reporte
//console.log("Importe: " + ventaModel.importe);
//console.log("Impuesto: " + ventaModel.impuesto);
//console.log("Total: " + ventaModel.total);


