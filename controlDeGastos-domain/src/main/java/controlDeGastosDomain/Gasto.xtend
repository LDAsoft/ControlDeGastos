package controlDeGastosDomain

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate

@Accessors
class Gasto {
	
	String descripcion;
	float monto;
	LocalDate fecha;
	
	new(String descripcion, float monto, LocalDate fecha){ 
		this.descripcion = descripcion
		this.monto = monto
		this.fecha = fecha
	}
	
}