package controlDeGastosDomain

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	Integer idUsuario
	String nombreDeUsuario
	String password
	List<Gasto> gastos
	
	new(Integer id, String nombreDeUsuario, String password){
		this.idUsuario= id
		this.nombreDeUsuario = nombreDeUsuario
		this.password = password
		this.gastos = new ArrayList
	}
	
	def agregarGasto(Gasto unGasto){
		gastos.add(unGasto)
	}
	
	def eliminarGasto(Gasto unGasto){
		gastos.remove(unGasto)
	}
	
}