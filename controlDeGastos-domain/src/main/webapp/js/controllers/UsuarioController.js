gastosApp.controller("UsuarioController", function (mainService,$state,$scope) {

    $scope.ingresar = function (findUser) {
        mainService.ingresar(findUser, function(usuarioObtenido){
            if(usuarioObtenido !== null){
                mainService.datosDelUsuario(usuarioObtenido.data);
                $state.go("mainPage");
            }

        },notificarError);
    };

    $scope.registrar = function (userToRegister) {
        mainService.registrar(userToRegister, function(nuevoUsuarioRegistrado){
            if(nuevoUsuarioRegistrado !== null){
                mainService.datosDelUsuario(nuevoUsuarioRegistrado);
                $state.go("mainPage");
                //console.log (nuevoUsuarioRegistrado.data.idUsuario);
            }

        },notificarError);
    };    


    /*$scope.showAlert = function(mensaje) {
        $mdDialog.show(
            $mdDialog.alert()
                .parent(angular.element(document.querySelector('#popupContainer')))
                .clickOutsideToClose(true)
                .title('Error al ingresar')
                .textContent(mensaje)
                .ariaLabel('Alert Dialog Demo')
                .ok('Got it!')
        );
    };*/

    function notificarError(mensaje) {
        //this.showAlert(mensaje.data);
        console.log(mensaje.data);
    }

});