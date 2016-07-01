package appHelpers

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GastosYTotal {
	List<GastoParaMostrar> gastos
	Double montoTotal
	
	new (List<GastoParaMostrar> unosGastos, Double unTotal){
		this.gastos=unosGastos
		this.montoTotal=unTotal
	}
	
}