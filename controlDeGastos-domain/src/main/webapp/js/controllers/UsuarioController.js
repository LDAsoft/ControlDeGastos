gastosApp.controller("UsuarioController", function (usuariosService,$state,$scope) {

    var self = this;
    self.usuarioABuscar = {
        user : "marcos",
        pass : "123456"
    };

    $scope.ingresar = function() {
        $state.go("lobby");
    	/*this.obtenerDatosUsuario(self.usuarioABuscar);*/
        
    };

	$scope.irARegistro = function() {
        $state.go("registro");
    };

 	/*function transformarADatosDeUsuario(jsonDatosDeUsuario) {
    	return DatosDeUsuario.asDatosDeUsuario(jsonDatosDeUsuario);
  	}


  	usuariosService.obtenerDatosUsuario(self.usuarioABuscar)
        .success(function(data){
                self.datosDeUsuario = data;
                console.log (data);
        })
        .error(function(error) {
            console.log(error);
        });*/

});


