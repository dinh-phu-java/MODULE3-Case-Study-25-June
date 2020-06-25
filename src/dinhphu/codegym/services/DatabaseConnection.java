package dinhphu.codegym.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String dbURL= "jdbc:mysql://localhost:3306/carcompany";
    private static final String userHost="root";
    private static final String passwordHost="qazWSX1@";

    public static Connection getConnection(){
        Connection connection=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection(dbURL,userHost,passwordHost);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
