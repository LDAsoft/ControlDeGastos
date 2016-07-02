//LO QUE NECESITE DE ACA ME FIJO EN TAREA.JS
function DatosDeUsuario() {

  this.idUsuario = null;
  this.nombreDeUsuario = "nobody";
  this.gastos = {};
  this.gastoTotal = 0;

}

DatosDeUsuario.asDatosDeUsuario = function (jsonDatosDeUsuario) {
  return angular.extend(new DatosDeUsuario(), jsonDatosDeUsuario);
};
