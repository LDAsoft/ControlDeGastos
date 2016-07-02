package controlDeGastosDomain.test

import controlDeGastosDomain.Gasto
import controlDeGastosDomain.Usuario
import org.junit.Before
import org.junit.Test

import static org.assertj.core.api.Assertions.*
import java.time.LocalDate

class TestUsuario {
	Gasto direcTv;
	Gasto gas;
	Gasto agua;
	Gasto cine;
	Usuario marcos;
	
	@Before
	def void setUp(){
		this.direcTv= new Gasto("DirecTv", 600.0, LocalDate.of(2016,01,27))
		this.gas = new Gasto("Gas", 1600.0, LocalDate.of(2016,01,27))
		this.agua = new Gasto("Agua", 200.9, LocalDate.of(2016,01,27))
		
		this.marcos = new Usuario(1,"marcos", "marcos1")
		this.marcos.setGastos(newArrayList(direcTv,gas,agua))
		
		this.cine = new Gasto("Cine 4D x 2", 440.9, LocalDate.of(2016,01,27))
	}
	
	@Test
    def void testRapidoGasto(){
        assertThat(this.gas.esMismoAnio("2015")).^false
    }
    
    @Test
    def void testRapidoGasto2(){
        assertThat(this.gas.esMismoAnio("2012")).^false
    }
    
    @Test
    def void testRapidoGasto3(){
        assertThat(this.gas.esMismoAnio("2016")).^true
    }
	
	@Test
    def void elLengthDeLosGastosDeMarcosEs3(){
        assertThat(this.marcos.gastos.length)equals(3)
    }
	
	@Test
    def void EliminoGastoGasEntoncesLengthDeGastosEs2(){
        this.marcos.eliminarGasto(this.gas)
        assertThat(this.marcos.gastos.length)equals(2)
    }
    
	@Test
    def void agregarGastoCineEntoncesLengthDeGastosEs4(){
        this.marcos.agregarGasto(this.cine)
        assertThat(this.marcos.gastos.length)equals(4)
    }
    	
}