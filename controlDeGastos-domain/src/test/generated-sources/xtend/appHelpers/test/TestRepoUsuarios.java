package appHelpers.test;

import appHelpers.DetalleInflacionAnual;
import appHelpers.RepoUsuarios;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestRepoUsuarios {
  @Before
  public void setUp() {
  }
  
  @Test
  public void testRapidoGasto() {
    RepoUsuarios _instance = RepoUsuarios.getInstance();
    DetalleInflacionAnual _obtenerDatosDeInflacion = _instance.obtenerDatosDeInflacion(Integer.valueOf(3), "Agua", "2016");
    InputOutput.<DetalleInflacionAnual>println(_obtenerDatosDeInflacion);
  }
  
  @Test
  public void EliminoGastoGasEntoncesLengthDeGastosEs2() {
  }
}
