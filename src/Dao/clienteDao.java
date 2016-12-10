/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.clienteTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class clienteDao {
      Connection connection;

    public void registrarClienteFactura(clienteTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL Cliente_insertar(?,?,?)");
        cs.setString(1, to.getDni());
        cs.setString(2, to.getApellidos());
        cs.setString(3, to.getDireccion());
        cs.execute();

    }
    
}
