package servlet;
import java.sql.*;
public class DBConnection {
    public static Connection getConnection() {
        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crimems", "root", "root");
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error @DBConnection.getConnection(): " + e.getMessage());
            return null;
        }
    }
}
