package appHelpers.test

import org.junit.Before
import org.junit.Test

import static org.assertj.core.api.Assertions.*
import java.time.LocalDate
import appHelpers.RepoUsuarios

class TestRepoUsuarios {
	

	@Before
	def void setUp(){
	}
	
	@Test
    def void testRapidoGasto(){
    //    assertThat(this.gas.esMismoAnio("2015")).^false
    println(RepoUsuarios.instance.obtenerDatosDeInflacion(3,"Agua","2016"))
    }
    	
	@Test
    def void EliminoGastoGasEntoncesLengthDeGastosEs2(){
      //  this.marcos.eliminarGasto(this.gas)
        //assertThat(this.marcos.gastos.length)equals(2)
    }
    	
}