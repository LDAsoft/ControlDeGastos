gastosApp.controller("MainController", function (mainService,$state,$scope) {
    
    $scope.usuario = mainService.obtenerUsuario();
    $scope.gastos = mainService.obtenerGastos();
    $scope.montoTotal = mainService.obtenerGastoTotal();
    $scope.gastoNuevo = {};
    $scope.aFiltrar = {};
    $scope.indice = {};
    $scope.mostrarDatosInflacion = false;

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

    $scope.calcular = function () {
        this.indice.id = this.usuario.idUsuario;
        mainService.calcular(this.indice, function(datosInflacionarios){
            if(datosInflacionarios !== null){
                mostrarInflacion(datosInflacionarios.data);
            }

        },notificarError);
    };

    $scope.limpiarIndice = function(){
        $scope.indice = null;
        $scope.mostrarDatosInflacion = false;
        //mas cosas
    };

    $scope.logout = function(){
        $state.go("login");
    };


    function mostrarInflacion(datos){
        $scope.mostrarDatosInflacion = true;
        $scope.inflacionAcumulada = datos.inflacionAcumulada;
        $scope.detalleInflacionMensual = datos.detalleInflacionMensual;
        console.log(datos.detalleInflacionMensual);
        console.log(datos.inflacionAcumulada);
    }

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
