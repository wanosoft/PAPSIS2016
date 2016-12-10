/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.servicioTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class servicioDao {
     Connection connection;
public void RegistrarReparacion(servicioTo to)throws Exception{
    connection=conexion.getInstance().getConnection();
    CallableStatement ps=connection.prepareCall("CALL servicios_insertar(?,?,?)");
    ps.setString(1, to.getObservacion());
    ps.setDouble(2, to.getCosto());
    ps.setString(3, to.getFecha());
    ps.execute();    
}
    public String obteneriIDservicio() throws Exception {
        connection = conexion.getInstance().getConnection();
        String sql = "select codigoservicio from servicios";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.last();
        return rs.getString(1);
    }
       public String obtenerCodServc() throws Exception {
        connection = conexion.getInstance().getConnection();
        String sql = "SELECT codigoservicio FROM servicios";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.last();
        return rs.getString(1);
    }

    
}
