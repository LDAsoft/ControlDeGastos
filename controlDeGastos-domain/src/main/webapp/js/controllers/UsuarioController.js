gastosApp.controller("UsuarioController", function (usuariosService,$state,$scope) {

    var self = this;
    
    self.usuarioABuscar = {
        user : "marcos",
        pass : "123456"
    };

    $scope.irARegistro = function() {
        $state.go("registro");
    };

    /*self.ingresar = login;
    function ingresar () {
        $state.go("lobby");
    	/*this.obtenerDatosUsuario(self.usuarioABuscar);*/       
    

    
    $scope.ingresar = function () {
        usuariosService.obtener(self.usuarioABuscar, function(usuario){
            if(usuario !== null){
                console.log (usuario);
            }

        },notificarError);
    };
    

    function notificarError(mensaje) {
        console.log(mensaje);
    }



});








/*    function transformarADatosDeUsuario(jsonDatosDeUsuario) {
        return DatosDeUsuario.asDatosDeUsuario(jsonDatosDeUsuario);
    }*/
