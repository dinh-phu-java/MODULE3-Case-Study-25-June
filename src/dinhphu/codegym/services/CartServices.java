package dinhphu.codegym.services;

import dinhphu.codegym.model.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartServices implements ICart{
    public static  final String insertCartQuery="insert into carts(user_id,car_id) values(?,?)";
    public static  final String selectAllCartByUserId="select * from carts where user_id=?";
    public static final String removeCartByUserIdAndCarId="delete from carts where user_id=? and car_id=?";
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
    public void removeCart(int user_id,int car_id) {
        Connection connection=DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(removeCartByUserIdAndCarId);
            preparedStatement.setInt(1,user_id);
            preparedStatement.setInt(2,car_id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    @Override
    public List<Cart> selectAllCartByLoginUser(int user_id){
        Connection connection=DatabaseConnection.getConnection();
        ArrayList<Cart> carts=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectAllCartByUserId);
            preparedStatement.setInt(1,user_id);
            ResultSet rs= preparedStatement.executeQuery();
            while(rs.next()){
                carts.add(new Cart(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return carts;
    }


}
