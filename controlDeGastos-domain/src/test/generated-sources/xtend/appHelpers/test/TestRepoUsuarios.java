package appHelpers.test;

import appHelpers.RepoUsuarios;
import controlDeGastosDomain.DetalleInflacionAnual;
import controlDeGastosDomain.DetalleInflacionMensual;
import controlDeGastosDomain.Gasto;
import exceptions.ErrorDeFiltro;
import java.util.List;
import org.assertj.core.api.Assertions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestRepoUsuarios {
  @Before
  public void setUp() {
  }
  
  @Test
  public void testRapidoGastos() {
    RepoUsuarios _instance = RepoUsuarios.getInstance();
    List<Gasto> gastos = _instance.obtenerGastosPara(Integer.valueOf(1));
    RepoUsuarios _instance_1 = RepoUsuarios.getInstance();
    List<Gasto> resul = _instance_1.filtrarGastosPorDescripcion(gastos, "carne");
    Assertions.<ErrorDeFiltro>assertThatExceptionOfType(ErrorDeFiltro.class);
  }
  
  @Test
  public void testRapidoParaVerDetalleDeInflacion() {
    DetalleInflacionMensual detalle = null;
    String mes = null;
    Double monto = null;
    Double indice = null;
    RepoUsuarios _instance = RepoUsuarios.getInstance();
    DetalleInflacionAnual _obtenerDatosDeInflacion = _instance.obtenerDatosDeInflacion(Integer.valueOf(3), "Agua", "2016");
    List<DetalleInflacionMensual> _detalleInflacionMensual = _obtenerDatosDeInflacion.getDetalleInflacionMensual();
    DetalleInflacionMensual _get = _detalleInflacionMensual.get(0);
    detalle = _get;
    String _mes = detalle.getMes();
    mes = _mes;
    Double _monto = detalle.getMonto();
    monto = _monto;
    Double _indiceMensual = detalle.getIndiceMensual();
    indice = _indiceMensual;
    InputOutput.<String>println(((((("mes: " + mes) + "____monto:  ") + monto) + "____indice:  ") + indice));
    RepoUsuarios _instance_1 = RepoUsuarios.getInstance();
    DetalleInflacionAnual _obtenerDatosDeInflacion_1 = _instance_1.obtenerDatosDeInflacion(Integer.valueOf(3), "Agua", "2016");
    List<DetalleInflacionMensual> _detalleInflacionMensual_1 = _obtenerDatosDeInflacion_1.getDetalleInflacionMensual();
    DetalleInflacionMensual _get_1 = _detalleInflacionMensual_1.get(1);
    detalle = _get_1;
    String _mes_1 = detalle.getMes();
    mes = _mes_1;
    Double _monto_1 = detalle.getMonto();
    monto = _monto_1;
    Double _indiceMensual_1 = detalle.getIndiceMensual();
    indice = _indiceMensual_1;
    InputOutput.<String>println(((((("mes: " + mes) + "____monto:  ") + monto) + "____indice:  ") + indice));
    RepoUsuarios _instance_2 = RepoUsuarios.getInstance();
    DetalleInflacionAnual _obtenerDatosDeInflacion_2 = _instance_2.obtenerDatosDeInflacion(Integer.valueOf(3), "Agua", "2016");
    List<DetalleInflacionMensual> _detalleInflacionMensual_2 = _obtenerDatosDeInflacion_2.getDetalleInflacionMensual();
    DetalleInflacionMensual _get_2 = _detalleInflacionMensual_2.get(2);
    detalle = _get_2;
    String _mes_2 = detalle.getMes();
    mes = _mes_2;
    Double _monto_2 = detalle.getMonto();
    monto = _monto_2;
    Double _indiceMensual_2 = detalle.getIndiceMensual();
    indice = _indiceMensual_2;
    InputOutput.<String>println(((((("mes: " + mes) + "____monto:  ") + monto) + "____indice:  ") + indice));
    RepoUsuarios _instance_3 = RepoUsuarios.getInstance();
    DetalleInflacionAnual _obtenerDatosDeInflacion_3 = _instance_3.obtenerDatosDeInflacion(Integer.valueOf(3), "Agua", "2016");
    List<DetalleInflacionMensual> _detalleInflacionMensual_3 = _obtenerDatosDeInflacion_3.getDetalleInflacionMensual();
    DetalleInflacionMensual _get_3 = _detalleInflacionMensual_3.get(3);
    detalle = _get_3;
    String _mes_3 = detalle.getMes();
    mes = _mes_3;
    Double _monto_3 = detalle.getMonto();
    monto = _monto_3;
    Double _indiceMensual_3 = detalle.getIndiceMensual();
    indice = _indiceMensual_3;
    InputOutput.<String>println(((((("mes: " + mes) + "____monto:  ") + monto) + "____indice:  ") + indice));
    RepoUsuarios _instance_4 = RepoUsuarios.getInstance();
    DetalleInflacionAnual _obtenerDatosDeInflacion_4 = _instance_4.obtenerDatosDeInflacion(Integer.valueOf(3), "Agua", "2016");
    List<DetalleInflacionMensual> _detalleInflacionMensual_4 = _obtenerDatosDeInflacion_4.getDetalleInflacionMensual();
    DetalleInflacionMensual _get_4 = _detalleInflacionMensual_4.get(4);
    detalle = _get_4;
    String _mes_4 = detalle.getMes();
    mes = _mes_4;
    Double _monto_4 = detalle.getMonto();
    monto = _monto_4;
    Double _indiceMensual_4 = detalle.getIndiceMensual();
    indice = _indiceMensual_4;
    InputOutput.<String>println(((((("mes: " + mes) + "____monto:  ") + monto) + "____indice:  ") + indice));
  }
}
