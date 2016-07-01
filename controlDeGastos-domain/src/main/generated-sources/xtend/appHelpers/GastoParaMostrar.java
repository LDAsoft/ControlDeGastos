package appHelpers;

import controlDeGastosDomain.Gasto;
import java.time.LocalDate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class GastoParaMostrar {
  private String descripcion;
  
  private float monto;
  
  private String fecha;
  
  public GastoParaMostrar(final Gasto unGasto) {
    String _descripcion = unGasto.getDescripcion();
    this.descripcion = _descripcion;
    float _monto = unGasto.getMonto();
    this.monto = _monto;
    LocalDate _fecha = unGasto.getFecha();
    String _string = _fecha.toString();
    this.fecha = _string;
  }
  
  @Pure
  public String getDescripcion() {
    return this.descripcion;
  }
  
  public void setDescripcion(final String descripcion) {
    this.descripcion = descripcion;
  }
  
  @Pure
  public float getMonto() {
    return this.monto;
  }
  
  public void setMonto(final float monto) {
    this.monto = monto;
  }
  
  @Pure
  public String getFecha() {
    return this.fecha;
  }
  
  public void setFecha(final String fecha) {
    this.fecha = fecha;
  }
}
