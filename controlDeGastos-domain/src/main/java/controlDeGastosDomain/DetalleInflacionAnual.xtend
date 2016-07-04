package controlDeGastosDomain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class DetalleInflacionAnual {
	List<DetalleInflacionMensual> detalleInflacionMensual
	Double inflacionAcumulada
		
	new(List<DetalleInflacionMensual> unDetalleMensual) {
		this.detalleInflacionMensual= unDetalleMensual
		this.inflacionAcumulada = redondear(calcularInflacionAcumulada(unDetalleMensual))
	}
	
	def calcularInflacionAcumulada(List<DetalleInflacionMensual> listaDetalles) {
		listaDetalles.stream.mapToDouble[detalle | detalle.indiceMensual].sum
	}
	
	def double redondear(double numero){
       return Math.rint(numero*100)/100;
	}
	
}