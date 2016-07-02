app.controller("LaberintosController", ['$scope', 'resolveResponse', 'laberintosService', 
	function ($scope, resolveResponse, laberintosService) {

    self.idJugdor= {id:1};

    this.obtenerLaberintos = function(){
        laberintosService.obtenerLaberintos(
                self.idJugdor.id
                
        );
    };

}]);
