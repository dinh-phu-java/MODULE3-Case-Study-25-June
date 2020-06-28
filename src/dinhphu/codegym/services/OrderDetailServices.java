package dinhphu.codegym.services;

import dinhphu.codegym.model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDetailServices implements IOrderDetail {
    private static final String createOrderDetail="insert into order_detail(order_id,seller_id,car_id,price_manual) value(?,?,?,?)";
    @Override
    public void createOrderDetail(int order_id,int seller_id,int car_id,double price_manual) {
        Connection connection=DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(createOrderDetail);
            preparedStatement.setInt(1,order_id);
            preparedStatement.setInt(2,seller_id);
            preparedStatement.setInt(3,car_id);
            preparedStatement.setDouble(4,price_manual);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        OrderDetailServices orderDetailServices=new OrderDetailServices();
//        orderDetailServices.createOrderDetail(4,2,11,124.24);
//    }
}
