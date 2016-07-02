gastosApp.service('mainService', function ($http) {

	var usuario = {};

	this.obtenerUsuario= function(){
		return usuario;
	};

	this.datosDelUsuario = function(datos){
		usuario.gastos = datos.gastos;
		usuario.nombreDeUsuario = datos.nombreDeUsuario;
		usuario.idUsuario = datos.idUsuario;
		usuario.gastoTotal = datos.gastoTotal;
	};

  	this.ingresar = function (usuarioABuscar, callback, errorHandler) {
    	$http.post('/login', usuarioABuscar).then(callback, errorHandler);
  	};

	this.registrar = function (nuevoUsuario, callback, errorHandler) {
    	$http.put('/registrar', nuevoUsuario).then(callback, errorHandler);
  	};

});