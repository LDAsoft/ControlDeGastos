gastosApp.controller("UsuarioController", function (usuariosService,$state,$scope) {

    var self = this;
    
    self.usuarioABuscar = {
        user : "marcos",
        pass : "12345"
    };

    $scope.irARegistro = function() {
        $state.go("registro");
    };

    $scope.ingresar = function () {
        usuariosService.obtener(self.usuarioABuscar, function(usuario){
            if(usuario !== null){
                $state.go("lobby");
                console.log (usuario);
            }

        },notificarError);
    };
    

    function notificarError(mensaje) {
        console.log(mensaje.data);
    }

});