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
import org.uqbar.xtrest.http.ContentType
import appHelpers.GastoNuevo
import appHelpers.EditorDeObjetos

@Controller
class ControlDeGastosController {
		
    extension JSONUtils = new JSONUtils
	
	@Post('/login')
	def Result login(@Body String body) {
		try {
			val UsuarioLogin usuarioLogin = body.fromJson(UsuarioLogin) 
			val usuario = RepoUsuarios.getInstance.login(usuarioLogin.user, usuarioLogin.pass)
			response.contentType = ContentType.APPLICATION_JSON
			ok(EditorDeObjetos.getInstance.datosParaUsuario(usuario).toJson)
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
			ok(EditorDeObjetos.getInstance.datosParaUsuario(usuario).toJson)				
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
		ok(EditorDeObjetos.getInstance.gastosParaMostrar(refreshGastos).toJson)
	}
	
	@Get("/gastos/:id/:descripcion") 
	def Result gastos() {  
		try{
			response.contentType = ContentType.APPLICATION_JSON
			var idUsuario = Integer.valueOf(id)
			var gastos = RepoUsuarios.getInstance.obtenerGastosPara(idUsuario)
			var gastosFiltrados = RepoUsuarios.getInstance.filtrarGastosDeTipo(gastos,descripcion.toString)
		
			ok(EditorDeObjetos.getInstance.gastosParaMostrar(gastosFiltrados).toJson)	
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
	def Result pruebaObtenerUsuarios() {
		try{
		val usuarios = RepoUsuarios.getInstance.usuarios
		response.contentType = ContentType.APPLICATION_JSON
		ok(EditorDeObjetos.getInstance.reducirUsuarios(usuarios).toJson)}
		catch(Exception e){
			
		}
	}
	
	def static void main(String[] args) {
        XTRest.start(ControlDeGastosController, 9000)
    }
}