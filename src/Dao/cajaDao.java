/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.cajaTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class cajaDao {
     Connection connection;

  
    public ResultSet ventasFecha() throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT sum(total) , fecha FROM factura f where subtotal>0  group by fecha order by 2 desc limit 1");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet Reparaciones() throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT sum(total) , fecha FROM factura f where subtotal=0  group by fecha order by 2 desc limit 1");
        ResultSet rs = ps.executeQuery();
        return rs;
    }
    public ResultSet Compras() throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM detallecompra");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public void insertar(cajaTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("insert into caja values(?,?,?,?,?,?,?)");
        ps.setString(1, to.getFecha());
        ps.setDouble(2, to.getEntrada());
        ps.setDouble(3, to.getVentas());
        ps.setDouble(4, to.getReparaciones());
        ps.setDouble(5, to.getCompras());
        ps.setDouble(6, to.getTotalEfectivo());
        ps.setDouble(7, to.getTotalVentas());
        ps.execute();
    }

    public ResultSet reportarVentasXD(String fechaIncio, String fechaFin) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL ReportarVentas(?,?)");
        cs.setString(1, fechaIncio);
        cs.setString(2, fechaFin);
        ResultSet rs = cs.executeQuery();
        return rs;
    }

    public ResultSet  cajaView(cajaTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("select entrada  from caja  where fecha=?");
        ps.setString(1, to.getFecha());
        ResultSet rs=ps.executeQuery();
        return rs;
    }

    public ResultSet reportarVentas(String fechaIncio, String fechaFin) throws Exception {
        String sql;
        sql = "select f.codigofactura,c.datos,f.fecha,f.igv,f.subtotal,f.total from factura f ,cliente c where\n"
                + "f.codigoccliente=c.codigoccliente and f.total>0 and\n"
                + "fecha  between ? and ? order by subtotal ";
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, fechaIncio);
        ps.setString(2, fechaFin);
        ResultSet rs = ps.executeQuery();
        return rs;
    }
    public void finalizarCaja(cajaTo to)throws Exception{
        connection=conexion.getInstance().getConnection();
        CallableStatement cs=connection.prepareCall("CALL update_caja(?,?,?,?,?,?)");
        cs.setString(1, to.getFecha());
        cs.setDouble(2, to.getVentas());
        cs.setDouble(3, to.getReparaciones());
        cs.setDouble(4, to.getCompras());
        cs.setDouble(5, to.getTotalEfectivo());
        cs.setDouble(6, to.getTotalVentas());
        cs.execute();
    }
    
}
