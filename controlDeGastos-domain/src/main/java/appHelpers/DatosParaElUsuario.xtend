package appHelpers

import java.util.List
import controlDeGastosDomain.Gasto
import controlDeGastosDomain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DatosParaElUsuario {
	Integer idUsuario
	String nombreDeUsuario
	List<Gasto> gastos
	
	new(Usuario unUsuario){
		this.nombreDeUsuario = unUsuario.nombreDeUsuario
		this.gastos = unUsuario.gastos
		this.idUsuario=unUsuario.idUsuario
	}
}