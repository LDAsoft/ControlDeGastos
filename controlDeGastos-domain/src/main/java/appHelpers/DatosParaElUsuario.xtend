package appHelpers

import java.util.List
import controlDeGastosDomain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DatosParaElUsuario {
	Integer idUsuario
	String nombreDeUsuario
	List<GastoParaMostrar> gastos
	
	new(Usuario unUsuario, List<GastoParaMostrar> gastos){
		this.nombreDeUsuario = unUsuario.nombreDeUsuario
		this.gastos = gastos
		this.idUsuario=unUsuario.idUsuario
	}
	
}