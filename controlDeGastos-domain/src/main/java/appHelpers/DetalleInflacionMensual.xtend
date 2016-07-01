package appHelpers

import org.eclipse.xtend.lib.annotations.Accessors
import controlDeGastosDomain.Gasto

@Accessors
class DetalleInflacionMensual {
	String mes
	Double indiceMensual
	Double monto
	
	new(Gasto unGasto, Double indiceMensual) {
		this.mes = unGasto.fecha.month.toString
		this.monto = unGasto.monto
		this.indiceMensual = indiceMensual
	}
	
}