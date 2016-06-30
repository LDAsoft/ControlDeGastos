package exceptions

import org.omg.CORBA.UserException

class ErrorDeFiltro  extends UserException{
    new(String mensajeError){
        super(mensajeError)
    }
	
}