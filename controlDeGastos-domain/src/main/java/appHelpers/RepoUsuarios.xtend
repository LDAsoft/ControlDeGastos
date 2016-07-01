package appHelpers

import java.util.List
import controlDeGastosDomain.Usuario
import controlDeGastosDomain.Gasto
import java.time.LocalDate
import exceptions.ErrorDeFiltro
import exceptions.ErrorAlRegistrarse
import exceptions.ErrorLogin

class RepoUsuarios {

	List<Usuario> usuarios;
	
	static val INSTANCE = new RepoUsuarios
	
	def static getInstance() {
		INSTANCE
	}	
	
	def usuarios (){
		this.usuarios
	}	
	
	def registrarUsuario(String nombreDeUsuario, String password){
		verificarExistenciaDeUsuario(nombreDeUsuario)
		verificarRequisitosDePassword(password)
		registrarNuevoUsuario(nombreDeUsuario, password)
		getUsuarioByName(nombreDeUsuario)
	}
	
	private def verificarRequisitosDePassword(String password){
		verificarLongitud(password)
		verificarAlfanumerico(password)
	}
	
	private def verificarLongitud(String password){
		if(!(password.length >= 5 && password.length <= 20)){
			throw new ErrorAlRegistrarse("La longitud de la contrasenia debe ser al menos de 5 caracteres y como maximo 20 ")
		}
	}
	
	private def verificarAlfanumerico(String password){
			 	
		var resultado = false
		for (char c : password.toCharArray) {
    		if (!Character.isLetterOrDigit(c)) return (resultado = false);
    		if (c.toString.matches("[0-9]")){
    			resultado = true
    		}    		
		}
		if(!resultado) throw new ErrorAlRegistrarse("La contrasenia debe contener al menos un numero")
	}
			
	private def registrarNuevoUsuario(String nombreDeUsuario, String password){
		var nuevoUsuario = new Usuario(ultimoId() + 1,nombreDeUsuario, password)
		this.usuarios.add(nuevoUsuario)		
	}
	
	def ultimoId(){
        usuarios.maxBy[usuario | usuario.idUsuario].idUsuario
    }
    
	def verificarExistenciaDeUsuario(String nombreDeUsuario){
        if(existeElUsuario(nombreDeUsuario)) {
            throw new ErrorAlRegistrarse("El usuario ya se encuentra registrado, ingrese un nuevo nombre de usuario")
        }
    }
    
    def existeElUsuario(String nombreDeUsuario){
        usuarios.exists[usuario| usuario.nombreDeUsuario == nombreDeUsuario]
    }
	
	def Usuario login(String nombreDeUsuario, String password){
        if(!existeElUsuario(nombreDeUsuario)) {
        	throw new ErrorLogin("El usuario ingresado no existe")
        }
        val usuario = getUsuarioByName(nombreDeUsuario)
        validarPassword(usuario, password)
        usuario        
    }

    def getUsuarioByName(String nombreDeUsuario){
        usuarios.findFirst[usuario | usuario.nombreDeUsuario == nombreDeUsuario]
    }
    
    def getUsuarioById(Integer id){
        usuarios.findFirst[usuario | usuario.idUsuario == id]
    }
    
    def validarPassword(Usuario usuario, String password){
        if(!(usuario.password == password)){
            throw new ErrorLogin("Contrasenia incorrecta")
        }
    }
    
    def registrarGasto(GastoNuevo nuevoGasto) {
		var fechaActual = LocalDate.now
		var gasto = new Gasto(nuevoGasto.descripcion,nuevoGasto.monto,fechaActual)
		getUsuarioById(nuevoGasto.idUsuario).agregarGasto(gasto)
	}
	
	def obtenerGastosPara(Integer unUsuarioId) {
		getUsuarioById(unUsuarioId).gastos		
	}
	
	def filtrarGastosDeTipo(List<Gasto> gastos, String descripcion) {
		var List<Gasto> gastosFiltrados = gastos.filter[gasto | gasto.descripcion == descripcion].toList
		if(gastosFiltrados.empty){
			throw new ErrorDeFiltro("No existen datos para esa descripcion")
		}
		gastosFiltrados
	}
	
	
    new(){
        usuarios = armarUsuarios()
    }

    private def armarUsuarios(){
        var marcos = new Usuario(1,"marcos", "12345")
        var daniel = new Usuario(2,"daniel", "12345")
        var alvarenga = new Usuario(3,"alvarenga", "12345")
        
        marcos.setGastos(gastosDeMarcos)
        daniel.setGastos(gastosDeDaniel)
        alvarenga.setGastos(gastosDeAlvarenga)
        newArrayList(marcos,daniel,alvarenga)
    }

    private def gastosDeMarcos(){
        var direcTv = new Gasto("DirectTv", 540, LocalDate.now())
        var luz = new Gasto("Luz", 1500, LocalDate.of(2016,01,27))
        var gas = new Gasto("Gas", 1650, LocalDate.of(2016,01,27))
        
        newArrayList(direcTv,luz, gas)   
    }
    
    private def gastosDeDaniel(){
        var cableVision = new Gasto("CableVision", 670, LocalDate.of(2016,01,27))
        var agua = new Gasto("Agua", 90, LocalDate.of(2016,01,27))
        var seguroAutomotor = new Gasto("Seguro Automotor", 1200, LocalDate.of(2016,01,27))
        
        newArrayList(cableVision,agua, seguroAutomotor)   
    }
    
    private def gastosDeAlvarenga(){
        var teleCentro = new Gasto("TeleCentro", 400, LocalDate.of(2016,01,27))
        var luz = new Gasto("Luz", 1600, LocalDate.of(2016,01,27))
        var agua = new Gasto("Agua", 500, LocalDate.of(2016,01,27))
        
        newArrayList(teleCentro,luz, agua)   
    }	
}