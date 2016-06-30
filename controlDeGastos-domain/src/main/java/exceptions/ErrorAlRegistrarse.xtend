package exceptions

import org.omg.CORBA.UserException

class ErrorAlRegistrarse extends UserException{
	
    new(String mensajeError){
        super(mensajeError)   
    }
}