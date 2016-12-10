/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.marcaProductoTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class marcaProducto {
    Connection connection;

    public void grabar(marcaProductoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL marca_prod_Insertar(?,?,?)");
        cs.setString(1, to.getMarca());
        cs.setString(2, to.getModelo());
        cs.setString(3, to.getCaracteristica());
        cs.execute();

    }

    public void update(marcaProductoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL updata_marca_prod(?,?,?,?)");
        cs.setString(1, to.getCodigo());
        cs.setString(2, to.getMarca());
        cs.setString(3, to.getModelo());
        cs.setString(4, to.getCaracteristica());
        cs.execute();

    }

    public ResultSet buscar(String marca, String caracteristica, String modelo) throws Exception {
        marca = '%' + marca + '%';
        modelo = '%' + modelo + '%';
        caracteristica = '%' + caracteristica + '%';
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps
                = connection.prepareStatement("SELECT * FROM marca_producto where nombre like ? or modelo like ? or caracteristicas like ?");
        ps.setString(1, marca);
        ps.setString(2, modelo);
        ps.setString(3, caracteristica);
        ResultSet rs = ps.executeQuery();
        return rs;

    }
  
    
}
