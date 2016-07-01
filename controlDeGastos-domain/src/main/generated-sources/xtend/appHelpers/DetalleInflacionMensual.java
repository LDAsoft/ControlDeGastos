package appHelpers;

import controlDeGastosDomain.Gasto;
import java.time.LocalDate;
import java.time.Month;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DetalleInflacionMensual {
  private String mes;
  
  private Double indiceMensual;
  
  private Double monto;
  
  public DetalleInflacionMensual(final Gasto unGasto, final Double indiceMensual) {
    LocalDate _fecha = unGasto.getFecha();
    Month _month = _fecha.getMonth();
    String _string = _month.toString();
    this.mes = _string;
    Double _monto = unGasto.getMonto();
    this.monto = _monto;
    double _redondear = this.redondear((indiceMensual).doubleValue());
    this.indiceMensual = Double.valueOf(_redondear);
  }
  
  public double redondear(final double numero) {
    double _rint = Math.rint((numero * 100));
    return (_rint / 100);
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
