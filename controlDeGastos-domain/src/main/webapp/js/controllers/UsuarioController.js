gastosApp.controller("UsuarioController", function (mainService,$state,$scope) {

    $scope.ingresar = function (findUser) {
        mainService.ingresar(findUser, function(usuarioObtenido){
            if(usuarioObtenido !== null){
                mainService.datosDelUsuario(usuarioObtenido.data);
                $state.go("mainPage");                
            }

        },errorHandler);
    };

    $scope.registrar = function (userToRegister) {
        mainService.registrar(userToRegister, function(nuevoUsuarioRegistrado){
            if(nuevoUsuarioRegistrado !== null){
                mainService.datosDelUsuario(nuevoUsuarioRegistrado.data);
                $state.go("mainPage");
            }

        },errorHandler);
    };    

    function errorHandler(error) {
        $scope.mostrarError = error.data;
    }

});