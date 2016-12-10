/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.productoTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class productoDao {
     Connection connection;

    public ResultSet buscar(String marca, String caracteristica) throws Exception {
        marca = '%' + marca + '%';
        caracteristica = '%' + caracteristica + '%';
        Connection connection = conexion.getInstance().getConnection();
        PreparedStatement ps
                = connection.prepareStatement("SELECT * FROM vproducto v where nombre like ? or categoria like ?");
        ps.setString(1, marca);
        ps.setString(2, caracteristica);
        ResultSet rs = ps.executeQuery();
        return rs;

    }
    public ResultSet buscar1(String marca, String caracteristica) throws Exception {
        marca = '%' + marca + '%';
        caracteristica = '%' + caracteristica + '%';
        Connection connection = conexion.getInstance().getConnection();
        PreparedStatement ps
                = connection.prepareStatement("SELECT * FROM v_producto v where nombre like ? or categoria like ?");
        ps.setString(1, marca);
        ps.setString(2, caracteristica);
        ResultSet rs = ps.executeQuery();
        return rs;

    }

    public void reduceProducto(int cantidad, productoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("update producto stock set stock=stock-? where codigoProducto=?");
        ps.setInt(1, cantidad);
        ps.setString(2, to.getCodigoProd());
        ps.execute();
    }

    public ResultSet cargaMarca() throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM marca_producto  ");
        ResultSet rs = ps.executeQuery();
        return rs;
    }
    public ResultSet cargaMarcas() throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM marca_producto group by nombre  ");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public void registrProducto(productoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL Producto_insertar(?,?,?,?,?)");
        cs.setString(1, to.getCodMarca());
        cs.setString(2, to.getCategoria());
        cs.setDouble(3, to.getPrecio());
        cs.setString(4, to.getOperador());
        cs.setInt(5, to.getStock());
        cs.execute();

    }

    public void modificarProducto(productoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL Producto_modificar(?,?,?)");
        cs.setString(1, to.getCodigoProd());
        cs.setDouble(2, to.getPrecio());
        cs.setInt(3, to.getStock());
        cs.execute();

    }
    public void RegistrarComprar(productoTo to) throws Exception{
        connection=conexion.getInstance().getConnection();
        CallableStatement cs=connection.prepareCall("CALL compra_insertar(?,?)");
        cs.setInt(1, to.getCantidad());
        cs.setString(2, to.getFecha());
        cs.execute();
    }
        public String obtenerCodProducto() throws Exception {
        connection = conexion.getInstance().getConnection();
        String sql = "SELECT codigocompra FROM compra";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.last();
        return rs.getString(1);
    }
        public void registrarDetalleCompra(productoTo to)throws Exception{
            connection=conexion.getInstance().getConnection();
            PreparedStatement ps=connection.prepareStatement("insert into detalle_compra values(?,?,?,?,?)");
            ps.setString(1, to.getCodigoCompra());
            ps.setString(2, to.getCodMarca());
            ps.setDouble(3, to.getPrecio());
            ps.setInt(4, to.getCantidad());
            ps.setDouble(5, to.getImporte());
            ps.execute();
        }
    
}
