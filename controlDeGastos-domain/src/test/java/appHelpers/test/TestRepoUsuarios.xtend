package appHelpers.test

import appHelpers.RepoUsuarios
import org.junit.Before
import org.junit.Test
import controlDeGastosDomain.DetalleInflacionMensual

import static org.assertj.core.api.Assertions.*
import exceptions.ErrorDeFiltro

class TestRepoUsuarios {
	

	@Before
	def void setUp(){
	}
	
	@Test
    def void testRapidoGastos(){
    	var gastos = RepoUsuarios.instance.obtenerGastosPara(1)
    	var resul =RepoUsuarios.instance.filtrarGastosPorDescripcion(gastos, "carne")
		assertThatExceptionOfType(ErrorDeFiltro)
		
	}
	
	@Test
    def void testRapidoParaVerDetalleDeInflacion(){
    	var DetalleInflacionMensual detalle  
    	var String mes 
    	var Double monto 
    	var Double indice
    
    	detalle = RepoUsuarios.instance.obtenerDatosDeInflacion(3,"Agua","2016").detalleInflacionMensual.get(0)
    	mes = detalle.mes
    	monto = detalle.monto
    	indice = detalle.indiceMensual
    	println("mes: "+mes+"____monto:  " +monto+"____indice:  " +indice)
    
    	detalle = RepoUsuarios.instance.obtenerDatosDeInflacion(3,"Agua","2016").detalleInflacionMensual.get(1)
    	mes = detalle.mes
    	monto = detalle.monto
    	indice = detalle.indiceMensual
    	println("mes: "+mes+"____monto:  " +monto+"____indice:  " +indice)
    
    	detalle = RepoUsuarios.instance.obtenerDatosDeInflacion(3,"Agua","2016").detalleInflacionMensual.get(2)
    	mes = detalle.mes
    	monto = detalle.monto
    	indice = detalle.indiceMensual
    	println("mes: "+mes+"____monto:  " +monto+"____indice:  " +indice)
    
    	detalle = RepoUsuarios.instance.obtenerDatosDeInflacion(3,"Agua","2016").detalleInflacionMensual.get(3)
    	mes = detalle.mes
    	monto = detalle.monto
    	indice = detalle.indiceMensual
    	println("mes: "+mes+"____monto:  " +monto+"____indice:  " +indice)
    
	    detalle = RepoUsuarios.instance.obtenerDatosDeInflacion(3,"Agua","2016").detalleInflacionMensual.get(4)
	    mes = detalle.mes
    	monto = detalle.monto
    	indice = detalle.indiceMensual
      	
    	println("mes: "+mes+"____monto:  " +monto+"____indice:  " +indice)
    }
    	
}