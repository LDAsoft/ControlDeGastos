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
            }

        },notificarError);
    };    


    /*  revisar las paginas sobre como inyectar dependencias necsarias
    $scope.showAlert = function(mensaje) {
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