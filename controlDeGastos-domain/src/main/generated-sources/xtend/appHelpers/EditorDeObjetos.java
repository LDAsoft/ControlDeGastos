package appHelpers;

import appHelpers.DatosParaElUsuario;
import appHelpers.GastoParaMostrar;
import controlDeGastosDomain.Gasto;
import controlDeGastosDomain.Usuario;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class EditorDeObjetos {
  private final static EditorDeObjetos INSTANCE = new EditorDeObjetos();
  
  public static EditorDeObjetos getInstance() {
    return EditorDeObjetos.INSTANCE;
  }
  
  public DatosParaElUsuario datosParaUsuario(final Usuario usuario) {
    List<Gasto> _gastos = usuario.getGastos();
    List<GastoParaMostrar> _gastosParaMostrar = this.gastosParaMostrar(_gastos);
    return new DatosParaElUsuario(usuario, _gastosParaMostrar);
  }
  
  public List<GastoParaMostrar> gastosParaMostrar(final List<Gasto> gastos) {
    return this.reducirGastos(gastos);
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
