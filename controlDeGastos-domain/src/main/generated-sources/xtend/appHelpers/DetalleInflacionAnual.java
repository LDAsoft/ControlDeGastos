package appHelpers;

import appHelpers.DetalleInflacionMensual;
import java.util.List;
import java.util.function.ToDoubleFunction;
import java.util.stream.DoubleStream;
import java.util.stream.Stream;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DetalleInflacionAnual {
  private List<DetalleInflacionMensual> detalleInflacionMensual;
  
  private Double inflacionAcumulada;
  
  public DetalleInflacionAnual(final List<DetalleInflacionMensual> unDetalleMensual) {
    this.detalleInflacionMensual = unDetalleMensual;
    double _calcularInflacionAcumulada = this.calcularInflacionAcumulada(unDetalleMensual);
    this.inflacionAcumulada = Double.valueOf(_calcularInflacionAcumulada);
  }
  
  public double calcularInflacionAcumulada(final List<DetalleInflacionMensual> listaDetalles) {
    Stream<DetalleInflacionMensual> _stream = listaDetalles.stream();
    final ToDoubleFunction<DetalleInflacionMensual> _function = (DetalleInflacionMensual detalle) -> {
      return (detalle.getIndiceMensual()).doubleValue();
    };
    DoubleStream _mapToDouble = _stream.mapToDouble(_function);
    return _mapToDouble.sum();
  }
  
  @Pure
  public List<DetalleInflacionMensual> getDetalleInflacionMensual() {
    return this.detalleInflacionMensual;
  }
  
  public void setDetalleInflacionMensual(final List<DetalleInflacionMensual> detalleInflacionMensual) {
    this.detalleInflacionMensual = detalleInflacionMensual;
  }
  
  @Pure
  public Double getInflacionAcumulada() {
    return this.inflacionAcumulada;
  }
  
  public void setInflacionAcumulada(final Double inflacionAcumulada) {
    this.inflacionAcumulada = inflacionAcumulada;
  }
}
