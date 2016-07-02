gastosApp.service('usuariosService', function ($http) {

  this.obtener = function (usuarioABuscar, callback, errorHandler) {
    $http.post('/login', usuarioABuscar).then(callback, errorHandler);
  };
  //obtenerDatosUsuario es igual a update
  //usuarioABuscar es igual a tarea

});