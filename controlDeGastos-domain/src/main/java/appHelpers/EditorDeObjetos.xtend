package appHelpers

import controlDeGastosDomain.Usuario
import java.util.List
import controlDeGastosDomain.Gasto

class EditorDeObjetos {
		
	static val INSTANCE = new EditorDeObjetos
	
	def static getInstance() {
		INSTANCE
	}
	
	def datosParaUsuario(Usuario usuario) {
		new DatosParaElUsuario(usuario, reducirGastos(usuario.gastos), montoTotal(usuario.gastos))
	}
	
	def montoTotal(List<Gasto> gastos) {
		gastos.stream.mapToDouble[gasto | gasto.monto].sum
	}
	
	def gastosParaMostrar(List<Gasto> gastos) {
		new GastosYTotal(reducirGastos(gastos), montoTotal(gastos))
	}
		
	private def reducirGastos(List<Gasto> gastosParaEditar){
		var List<GastoParaMostrar> gastosListosParaMostrar = newArrayList()
		for (gastoAEditar : gastosParaEditar) {
			gastosListosParaMostrar.add(new GastoParaMostrar(gastoAEditar))
		}
		gastosListosParaMostrar
	}
	
	def reducirUsuarios(List<Usuario> usuariosAEditar) {
		var List<DatosParaElUsuario> usuariosParaMostrar = newArrayList()
		for (usuarioAEditar : usuariosAEditar) {
			usuariosParaMostrar.add(datosParaUsuario(usuarioAEditar))
		}
		usuariosParaMostrar
	}
	
}