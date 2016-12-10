/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.detalleVentaTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class detalleDao {
    
    Connection connection;

    public void grabarDetalle(detalleVentaTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL insertar_detalleventa(?,?,?,?,?,?)");
        cs.setString(1, to.getCodfactura());
        cs.setString(2, to.getCodproducto());
        cs.setString(3, to.getCodempleado());
        cs.setDouble(4, to.getPrecio());
        cs.setInt(5, to.getCantidad());
        cs.setDouble(6, to.getImporte());
        cs.execute();

    }

    public void grabarDetalleReparaciones(detalleVentaTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("insert into detalle_servicio value(?,?,?,?,?,?)");
        ps.setString(1, to.getCodfactura());
        ps.setString(2, to.getCodServ());
        ps.setDouble(3, to.getPrecio());
        ps.setInt(4, to.getCantidad());
        ps.setDouble(5, to.getImporte());
        ps.setString(6, to.getCodempleado());
        ps.execute();

    }
    
}
