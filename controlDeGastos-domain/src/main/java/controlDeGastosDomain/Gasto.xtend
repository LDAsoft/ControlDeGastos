package controlDeGastosDomain

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate

@Accessors
class Gasto {
	String descripcion;
	Double monto;
	LocalDate fecha;
	
	new(String descripcion, Double monto, LocalDate fecha){ 
		this.descripcion = descripcion
		this.monto = monto
		this.fecha = fecha
	}
	
	def esMismoAnio(String anio) {
		this.fecha.year.toString == anio
	}
	
}