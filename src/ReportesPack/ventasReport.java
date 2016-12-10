/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ReportesPack;

/**
 *
 * @author WANOSOFT
 */
public class ventasReport {
    String codigofactura,datos,fecha;
    double igv,subtotal,total;

    public ventasReport(String codigofactura, String datos, String fecha, double igv, double subtotal, double total) {
        this.codigofactura = codigofactura;
        this.datos = datos;
        this.fecha = fecha;
        this.igv = igv;
        this.subtotal = subtotal;
        this.total = total;
    }

    public String getCodigofactura() {
        return codigofactura;
    }

    public void setCodigofactura(String codigofactura) {
        this.codigofactura = codigofactura;
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

   
   
}
