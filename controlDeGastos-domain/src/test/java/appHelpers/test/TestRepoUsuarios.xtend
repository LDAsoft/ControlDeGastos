package appHelpers.test

import appHelpers.DetalleInflacionMensual
import appHelpers.RepoUsuarios
import org.junit.Before
import org.junit.Test

class TestRepoUsuarios {
	

	@Before
	def void setUp(){
	}
	
	@Test
    def void testRapidoGasto(){
    //    assertThat(this.gas.esMismoAnio("2015")).^false
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
    	
	@Test
    def void EliminoGastoGasEntoncesLengthDeGastosEs2(){
      //  this.marcos.eliminarGasto(this.gas)
        //assertThat(this.marcos.gastos.length)equals(2)
    }
    	
}