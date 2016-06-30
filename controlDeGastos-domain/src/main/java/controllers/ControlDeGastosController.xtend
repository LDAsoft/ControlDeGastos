package controllers

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Put
import appHelpers.RepoUsuarios
import org.uqbar.xtrest.api.annotation.Body
import appHelpers.UsuarioLogin
import appHelpers.DatosParaElUsuario
import org.uqbar.xtrest.http.ContentType
import appHelpers.GastoNuevo

@Controller
class ControlDeGastosController {
		
    extension JSONUtils = new JSONUtils
	
	@Post('/login')
	def Result login(@Body String body) {
		try {
			val UsuarioLogin usuarioLogin = body.fromJson(UsuarioLogin) 
			val usuario = RepoUsuarios.getInstance.login(usuarioLogin.user, usuarioLogin.pass)
			response.contentType = ContentType.APPLICATION_JSON
			ok(new DatosParaElUsuario(usuario).toJson)
		} catch (Exception e) {
			badRequest(e.message)
		}
	}
	
	@Put("/registrar")
	def Result registrar(@Body String body) { 
		try{
			val UsuarioLogin usuarioLogin = body.fromJson(UsuarioLogin) 
			val usuario = RepoUsuarios.getInstance.registrarUsuario(usuarioLogin.user, usuarioLogin.pass)
			response.contentType = ContentType.APPLICATION_JSON
			ok(new DatosParaElUsuario(usuario).toJson)				
		}catch (Exception e) {
			badRequest(e.message)
		}
	}
	
	@Put("/registrarGasto") 
	def Result registrarGasto(@Body String body) { 
		val nuevoGasto = body.fromJson(GastoNuevo) 
		RepoUsuarios.getInstance.registrarGasto(nuevoGasto)
		val refreshGastos = RepoUsuarios.getInstance.obtenerGastosPara(nuevoGasto.idUsuario)
		response.contentType = ContentType.APPLICATION_JSON
		ok(refreshGastos.toJson)
	}
	
	@Get("/gastos/:id/:descripcion") 
	def Result gastos() {  
		try{
			response.contentType = ContentType.APPLICATION_JSON
			var idUsuario = Integer.valueOf(id)
			var gastos = RepoUsuarios.getInstance.obtenerGastosPara(idUsuario)
			var respuesta = RepoUsuarios.getInstance.filtrarGastosDeTipo(gastos,descripcion.toString)
		
			ok(respuesta.toJson)	
		}catch(Exception e){
			notFound(e.message)
		}
	}

	@Get("/pruebaDeInflacion/:id/:descripcion/:anio") //Obtener los dtos inflacionarios
	def Result pruebaDeInflacion() {  
		try{
			response.contentType = ContentType.APPLICATION_JSON
			var idUsuario = Integer.valueOf(id)
			var gastos = RepoUsuarios.getInstance.obtenerGastosPara(idUsuario)
			var respuesta = RepoUsuarios.getInstance.filtrarGastosDeTipo(gastos,descripcion.toString)
		
			ok(respuesta.toJson)	
		}catch(Exception e){
			notFound(e.message)
		}
	}
		
	@Get("/usuarios")
	def Result usuarios() {
		try{
		val usuarios = RepoUsuarios.getInstance.usuarios
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)}
		catch(Exception e){
			
		}
	}
	
	def static void main(String[] args) {
        XTRest.start(ControlDeGastosController, 9000)
    }
	
//
//	@Get("/realizarAccion/:idUser/:idHab/:idAcc")
//	def Result realizarAccionEnHabitacion() {
//		
//		response.contentType = "application/json"
//		
//		val idHabitacion = Integer.valueOf(idHab)
//		val idAccion = Integer.valueOf(idAcc)
//		val idUsuario = Integer.valueOf(idUser)
//
//		try{
//			ok(realizarAccion(idUsuario, idHabitacion, idAccion).toJson)
//		} catch (UserException e) {
//			notFound(e.message);
//		}
//	}
//
//    def realizarAccion(Integer idUsuario, Integer idHabitacion, Integer idAccion){
//        minificador.minificar(repoDeObjetos.accion(idUsuario, idHabitacion, idAccion))
//    }
//
//	@Get('/inventario/:idUsuario')
//	def inventario(){
//		response.contentType = "application/json"
//
//		val iIdUsuario = Integer.valueOf(idUsuario)
//
//		try{
//			ok(inventario(iIdUsuario).getItems().toJson)
//		} catch (UserException e) {
//			notFound(e.message);
//		}
//	}
//
//	def inventario(Integer idUsuario){
//		repoDeObjetos.inventario(idUsuario)
//	}
//
//	@Put('/tirarInventario/:idUsuario')
//	def tirarInventario(){
//		response.contentType = "application/json"
//
//		val iIdUsuario = Integer.valueOf(idUsuario)
//
//		try{
//			tirarInventario(iIdUsuario)
//			ok()
//		} catch (UserException e) {
//			notFound(e.message);
//		}
//
//	}
//
//	def tirarInventario(Integer idUsuario){
//		repoDeObjetos.tirarInventario(idUsuario)
//	}
//
//	@Post('/login/:nombreUsuario/:password')
//	def Result login() {
//		val usuario = String.valueOf(nombreUsuario)
//		val pass = String.valueOf(password)
//
//		try {
//
//			repoDeObjetos.login(usuario, pass)
//			ok();
//		} catch (UserException e) {
//			forbidden(e.message)
//		}
//	}
//
//    def static void main(String[] args) {
//        XTRest.start(LaberintosController, 9000)
//    }
}