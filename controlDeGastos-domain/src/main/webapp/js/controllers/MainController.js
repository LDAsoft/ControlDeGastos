gastosApp.controller("MainController", function (mainService,$state,$scope) {
    
    $scope.usuario = mainService.obtenerUsuario();
    	
    $scope.gastos = mainService.obtenerGastos();
    	
    $scope.montoTotal = mainService.obtenerGastoTotal();
    
    $scope.nuevoGasto = function () {
    	this.gastoNuevo.idUsuario = this.usuario.idUsuario;
        mainService.ingresarGasto(this.gastoNuevo, function(gastosRefresh){
            if(gastosRefresh !== null){
                $scope.gastos = gastosRefresh.data.gastos;
                console.log($scope.gastos);
                console.log(gastosRefresh.data.gastos);
                $scope.montoTotal = gastosRefresh.data.montoTotal;
                console.log(gastosRefresh.data.montoTotal);
                $scope.gastoNuevo = null;
            }

        },notificarError);
    };

    //$scope.gastoNuevo.idUsuario = this.usuario.idUsuario;

    function notificarError(mensaje) {
        //this.showAlert(mensaje.data);
        console.log(mensaje.data);
    }

});


/*Integer idUsuario
	String nombreDeUsuario
	List<GastoParaMostrar> gastos
	Double gastoTotal;
informarGasto()
	*/
