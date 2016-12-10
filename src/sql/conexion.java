
package sql;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author WANOSOFT
 */
public class conexion {
    
      Connection connection= null;
    static conexion instance=null;

    public conexion() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost/sistemadeventa?user=root&password=0607");
    }
    public static conexion getInstance() throws Exception{
        if(instance==null){
            instance=new conexion();
        }
        return instance;
    }
    @Override
    public void finalize()throws Exception{
        if(connection.isClosed()){
            connection=null;
            connection.isClosed();
        }
    }

    public Connection getConnection() {
        return connection;
    }
}
