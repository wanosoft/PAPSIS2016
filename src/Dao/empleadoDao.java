/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import To.empleadoTo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sql.conexion;

/**
 *
 * @author WANOSOFT
 */
public class empleadoDao {
    Connection connection;

    public ResultSet cargaEmpleado() throws Exception {
        connection = conexion.getInstance().getConnection();
        PreparedStatement ps = connection.prepareStatement("select * from empleado where estado='a'");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public void RegistraEmpleado(empleadoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL empleado_insertar(?,?,?,?,?,?)");
        cs.setString(1, to.getDni());
        cs.setString(2, to.getApellidos());
        cs.setString(3, to.getNombres());
        cs.setString(4, to.getDireccion());
        cs.setString(5, to.getEmail());
        cs.setString(6, to.getTelefono());
        cs.execute();
    }

    public void ModificarEmpleado(empleadoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL update_empleado(?,?,?,?,?,?,?)");
        cs.setString(1, to.getCodigo());
        cs.setString(2, to.getDni());
        cs.setString(3, to.getApellidos());
        cs.setString(4, to.getNombres());
        cs.setString(5, to.getDireccion());
        cs.setString(6, to.getEmail());
        cs.setString(7, to.getTelefono());
        cs.execute();
    }

    public void EliminarEmpleado(empleadoTo to) throws Exception {
        connection = conexion.getInstance().getConnection();
        CallableStatement cs = connection.prepareCall("CALL eliminar_empleado(?)");
        cs.setString(1, to.getCodigo());
        cs.execute();
    }

    public ResultSet buscar(String apellido, String nombre, String dni) throws Exception {
        nombre = '%' + nombre + '%';
        apellido = '%' + apellido + '%';
        dni = '%' + dni + '%';
        String sql = "";
        Connection connection = conexion.getInstance().getConnection();
        PreparedStatement ps
                = connection.prepareStatement("SELECT * FROM vempleado where apellidos like ? or nombres like ? or  dni like ?");
        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, dni);
        ResultSet rs = ps.executeQuery();
        return rs;

    }

    
}
