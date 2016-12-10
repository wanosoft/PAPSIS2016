/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.facturaTo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class facturaDao {
     Connection connection;

    public String obteneriIDcliente() throws Exception {
        connection = conexion.getInstance().getConnection();
        String sql = "SELECT codigoccliente FROM cliente";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.last();
        return rs.getString(1);
    }

    public String obteneriIDfactura() throws Exception {
        connection = conexion.getInstance().getConnection();
        String sql = "SELECT codigofactura FROM factura";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.last();
        return rs.getString(1);
    }

    public void grabarFacturaVentas(facturaTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("insert into factura values(?,?,?,?,?,?)");
        ps.setString(1, to.getCodigoFactura());
        ps.setString(2, to.getCodigoCliente());
        ps.setString(3, to.getFecha());
        ps.setDouble(4, to.getIgv());
        ps.setDouble(5, to.getSubtotal());
        ps.setDouble(6, to.getTotal());
        ps.execute();
    }
    
    public ResultSet codigoFacturaTop()throws Exception{
        connection=conexion.getInstance().getConnection();
        PreparedStatement ps=connection.prepareStatement("select codigofactura from factura order by 1 desc limit 1");
        ResultSet rs=ps.executeQuery();
        return rs;
    }

    
}
