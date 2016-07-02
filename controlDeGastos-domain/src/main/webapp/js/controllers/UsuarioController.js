gastosApp.controller("UsuarioController", function (mainService,$state,$scope) {

    this.ingresar = function (findUser) {
        mainService.ingresar(findUser, function(usuarioObtenido){
            if(usuarioObtenido !== null){
                //mainService.datosDelUsuario(usuarioObtenido.data);
                console.log (usuarioObtenido.data);
                //$state.go("lobby");
            }

        },notificarError);
    };

    this.registrar = function (userToRegister) {
        mainService.registrar(userToRegister, function(nuevoUsuarioRegistrado){
            if(nuevoUsuarioRegistrado !== null){
      //          mainService.datosDelUsuario(nuevoUsuarioRegistrado);
                //$state.go("lobby");
                //console.log (nuevoUsuarioRegistrado.data);
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