package appHelpers

import org.eclipse.xtend.lib.annotations.Accessors
import controlDeGastosDomain.Gasto

@Accessors
class GastoParaMostrar {
	String descripcion;
	Double monto;
	String fecha;
	
	new(Gasto unGasto){ 
		this.descripcion = unGasto.descripcion
		this.monto = unGasto.monto
		this.fecha = unGasto.fecha.toString
	}
	
}