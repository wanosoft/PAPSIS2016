/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class logeoDao {
    
    Connection connection;
    public ResultSet cargaAcceso()throws Exception{
         connection=conexion.getInstance().getConnection();
        PreparedStatement ps=connection.prepareStatement("SELECT * FROM acceso ");
        ResultSet rs=ps.executeQuery();
        return rs;
    }
    
    public boolean validarAcceso(String usuario, String clave) throws SQLException {
                try {
            connection = conexion.getInstance().getConnection();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        PreparedStatement ps = connection.prepareStatement( "SELECT * FROM acceso WHERE idusuario=? AND contraseña=?");
        ps.setString(1, usuario);
        ps.setString(2, clave);
        ResultSet rs = ps.executeQuery();
        boolean rpta = rs.next();

        return rpta;
    }
    
    public void Insertar(To.logeo to)throws Exception{
      Connection connection=conexion.getInstance().getConnection();
        CallableStatement cs=connection.prepareCall("CALL insertar_usuario(?,?)");
        cs.setString(1, to.getUsuario());
        cs.setString(2, to.getContraseña());
        cs.execute();
    }

    
}
