package exceptions

import org.omg.CORBA.UserException

class ErrorLogin extends UserException{
    new(String mensajeError){
        super(mensajeError)
    }
	
}