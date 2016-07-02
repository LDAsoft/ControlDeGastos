package appHelpers;

import appHelpers.GastoParaMostrar;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class GastosYTotal {
  private List<GastoParaMostrar> gastos;
  
  private Double montoTotal;
  
  public GastosYTotal(final List<GastoParaMostrar> unosGastos, final Double unTotal) {
    this.gastos = unosGastos;
    this.montoTotal = unTotal;
  }
  
  @Pure
  public List<GastoParaMostrar> getGastos() {
    return this.gastos;
  }
  
  public void setGastos(final List<GastoParaMostrar> gastos) {
    this.gastos = gastos;
  }
  
  @Pure
  public Double getMontoTotal() {
    return this.montoTotal;
  }
  
  public void setMontoTotal(final Double montoTotal) {
    this.montoTotal = montoTotal;
  }
}
