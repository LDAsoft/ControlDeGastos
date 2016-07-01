package appHelpers

import java.util.List
import controlDeGastosDomain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DatosParaElUsuario {
	Integer idUsuario
	String nombreDeUsuario
	List<GastoParaMostrar> gastos
	Double gastoTotal;
	
	
	new(Usuario unUsuario, List<GastoParaMostrar> gastos, Double total){
		this.nombreDeUsuario = unUsuario.nombreDeUsuario
		this.idUsuario=unUsuario.idUsuario
		
		this.gastos = gastos
		this.gastoTotal=total
	}
	
}