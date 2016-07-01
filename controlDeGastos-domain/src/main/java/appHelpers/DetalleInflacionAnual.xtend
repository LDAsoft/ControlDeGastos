package appHelpers

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class DetalleInflacionAnual {
	List<DetalleInflacionMensual> detalleInflacionMensual
	Double inflacionAcumulada
		
	new(List<DetalleInflacionMensual> unDetalleMensual) {
		this.detalleInflacionMensual= unDetalleMensual
		this.inflacionAcumulada = calcularInflacionAcumulada(unDetalleMensual)
	}
	
	def calcularInflacionAcumulada(List<DetalleInflacionMensual> listaDetalles) {
		listaDetalles.stream.mapToDouble[detalle | detalle.indiceMensual].sum
	}
	
}