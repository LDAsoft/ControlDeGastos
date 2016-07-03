gastosApp.controller("MainController", function (mainService,$state,$scope) {
    
    $scope.usuario = mainService.obtenerUsuario();
    $scope.gastos = mainService.obtenerGastos();
    $scope.montoTotal = mainService.obtenerGastoTotal();
    $scope.gastoNuevo = {};
    $scope.aFiltrar = {};

    $scope.nuevoGasto = function () {
    	this.gastoNuevo.idUsuario = this.usuario.idUsuario;
        mainService.ingresarGasto(this.gastoNuevo, function(gastosRefresh){
            if(gastosRefresh !== null){
            	actualizarGastos(gastosRefresh.data);
            	$scope.gastoNuevo = null;
            }

        },notificarError);
    };

    $scope.filtrar = function () {
        this.aFiltrar.id = this.usuario.idUsuario;
        mainService.filtrar(this.aFiltrar, function(gastosRefresh){
            if(gastosRefresh !== null){
                actualizarGastos(gastosRefresh.data);
                $scope.aFiltrar = null;
            }

        },notificarError);
    };

    function actualizarGastos(gastosObtenidos){
    	$scope.gastos = gastosObtenidos.gastos;
        $scope.montoTotal = gastosObtenidos.montoTotal;
	}

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
