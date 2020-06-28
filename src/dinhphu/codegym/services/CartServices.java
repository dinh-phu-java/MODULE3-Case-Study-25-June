package dinhphu.codegym.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartServices implements ICart{
    public static  final String insertCartQuery="insert into carts(user_id,car_id) values(?,?)";
    @Override
    public void insertCart(int user_id, int car_id) {
        Connection connection=DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(insertCartQuery);
            preparedStatement.setInt(1,user_id);
            preparedStatement.setInt(2,car_id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteAllCart(int user_id) {

    }

    @Override
    public void removeCart(int cart_id) {

    }

    
}
