package appHelpers;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DetalleInflacionMensual {
  private String mes;
  
  private Double indiceMensual;
  
  private Double monto;
  
  public DetalleInflacionMensual() {
  }
  
  @Pure
  public String getMes() {
    return this.mes;
  }
  
  public void setMes(final String mes) {
    this.mes = mes;
  }
  
  @Pure
  public Double getIndiceMensual() {
    return this.indiceMensual;
  }
  
  public void setIndiceMensual(final Double indiceMensual) {
    this.indiceMensual = indiceMensual;
  }
  
  @Pure
  public Double getMonto() {
    return this.monto;
  }
  
  public void setMonto(final Double monto) {
    this.monto = monto;
  }
}
