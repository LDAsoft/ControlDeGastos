gastosApp.service('mainService', function ($http) {

	var usuario = {};
	var gastos = [];
	var montoTotal = {};

	this.obtenerUsuario = function(){
		return usuario;
	};

	this.obtenerGastos = function(){
		return gastos;
	};

	this.obtenerGastoTotal = function(){
		return montoTotal;
	};

	this.datosDelUsuario = function(datos){
		usuario.nombreDeUsuario = datos.nombreDeUsuario;
		usuario.idUsuario = datos.idUsuario;
		
		gastos = datos.gastos;
		montoTotal = datos.gastoTotal;	
	};

  	this.ingresar = function (usuarioABuscar, callback, errorHandler) {
    	$http.post('/login', usuarioABuscar).then(callback, errorHandler);
  	};

	this.registrar = function (nuevoUsuario, callback, errorHandler) {
    	$http.put('/registrar', nuevoUsuario).then(callback, errorHandler);
  	};

  	this.ingresarGasto = function (spending, callback, errorHandler) {
    	$http.put('/registrarGasto', spending).then(callback, errorHandler);
  	};

  	this.filtrar = function(aFiltrar, callback, errorHandler) {
         $http.get('/gastos/' + aFiltrar.id + '/' + aFiltrar.descripcion).then(callback,errorHandler);
 	};

});