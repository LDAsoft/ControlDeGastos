package appHelpers;

import appHelpers.DatosParaElUsuario;
import appHelpers.GastoParaMostrar;
import appHelpers.GastosYTotal;
import controlDeGastosDomain.Gasto;
import controlDeGastosDomain.Usuario;
import java.util.List;
import java.util.function.ToDoubleFunction;
import java.util.stream.DoubleStream;
import java.util.stream.Stream;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class EditorDeObjetos {
  private final static EditorDeObjetos INSTANCE = new EditorDeObjetos();
  
  public static EditorDeObjetos getInstance() {
    return EditorDeObjetos.INSTANCE;
  }
  
  public DatosParaElUsuario datosParaUsuario(final Usuario usuario) {
    List<Gasto> _gastos = usuario.getGastos();
    List<GastoParaMostrar> _reducirGastos = this.reducirGastos(_gastos);
    List<Gasto> _gastos_1 = usuario.getGastos();
    double _montoTotal = this.montoTotal(_gastos_1);
    return new DatosParaElUsuario(usuario, _reducirGastos, Double.valueOf(_montoTotal));
  }
  
  public double montoTotal(final List<Gasto> gastos) {
    Stream<Gasto> _stream = gastos.stream();
    final ToDoubleFunction<Gasto> _function = (Gasto gasto) -> {
      return (gasto.getMonto()).doubleValue();
    };
    DoubleStream _mapToDouble = _stream.mapToDouble(_function);
    return _mapToDouble.sum();
  }
  
  public GastosYTotal gastosParaMostrar(final List<Gasto> gastos) {
    List<GastoParaMostrar> _reducirGastos = this.reducirGastos(gastos);
    double _montoTotal = this.montoTotal(gastos);
    return new GastosYTotal(_reducirGastos, Double.valueOf(_montoTotal));
  }
  
  private List<GastoParaMostrar> reducirGastos(final List<Gasto> gastosParaEditar) {
    List<GastoParaMostrar> _xblockexpression = null;
    {
      List<GastoParaMostrar> gastosListosParaMostrar = CollectionLiterals.<GastoParaMostrar>newArrayList();
      for (final Gasto gastoAEditar : gastosParaEditar) {
        GastoParaMostrar _gastoParaMostrar = new GastoParaMostrar(gastoAEditar);
        gastosListosParaMostrar.add(_gastoParaMostrar);
      }
      _xblockexpression = gastosListosParaMostrar;
    }
    return _xblockexpression;
  }
  
  public List<DatosParaElUsuario> reducirUsuarios(final List<Usuario> usuariosAEditar) {
    List<DatosParaElUsuario> _xblockexpression = null;
    {
      List<DatosParaElUsuario> usuariosParaMostrar = CollectionLiterals.<DatosParaElUsuario>newArrayList();
      for (final Usuario usuarioAEditar : usuariosAEditar) {
        DatosParaElUsuario _datosParaUsuario = this.datosParaUsuario(usuarioAEditar);
        usuariosParaMostrar.add(_datosParaUsuario);
      }
      _xblockexpression = usuariosParaMostrar;
    }
    return _xblockexpression;
  }
}
