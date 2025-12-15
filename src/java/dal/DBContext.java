package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DBContext {

    protected Connection connection;
    protected PreparedStatement statement;
    protected ResultSet resultSet;
    
    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;"
                    + "databaseName=BookStore;"
                    + "encrypt=true;"
                    + "trustServerCertificate=true;";
            String user = "sa";
            String pass = "thanh2005";
            connection = DriverManager.getConnection(url, user, pass);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Connection error: " + e.getMessage());
            return null;
        }
    }
    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection conn = db.getConnection();
        System.out.println(conn);
    }
}
