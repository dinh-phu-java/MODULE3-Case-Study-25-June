package dinhphu.codegym.services;

import com.sun.org.apache.xpath.internal.operations.Or;
import dinhphu.codegym.model.Orders;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderServices implements IOrders{
    public static final String createOrderQuery="insert into orders(buyer_id,order_date,shipped_date) value(?,?,null)";
    public static final String selectLastRow="select max(order_id) from orders";
    public static final String selectOrderByBuyerId="select * from orders where buyer_id=? order by order_id desc";
    public static final String selectDeliveringOrder="select * from orders where shipped_date is null order by order_id desc";
    public static final String updateOrderShippedDate="update orders set shipped_date=? where order_id=?";

    @Override
    public void createOrder(int buyer_id , String order_date) {
        Connection connection=DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(createOrderQuery);
            preparedStatement.setInt(1,buyer_id);
            preparedStatement.setString(2,order_date);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    @Override
    public int getLastRecord(){
        Connection connection=DatabaseConnection.getConnection();
        int lastRow=-1;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectLastRow);
            ResultSet rs= preparedStatement.executeQuery();
            while(rs.next()){
                lastRow=rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return lastRow;
    }

    @Override
    public List<Orders> selectOrdersByBuyerId(int buyer_id){
        ArrayList<Orders> orderList= new ArrayList<>();
        Connection connection= DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectOrderByBuyerId);
            preparedStatement.setInt(1,buyer_id);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                orderList.add(new Orders(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return orderList;
    }
    @Override
    public List<Orders> selectDeliveringOrders(){
        ArrayList<Orders> orderList= new ArrayList<>();
        Connection connection= DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectDeliveringOrder);

            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                orderList.add(new Orders(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return orderList;
    }
    @Override
    public void updateOrderShippedDate(String shippedDate,int order_id){
        Connection connection=DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(updateOrderShippedDate);
            preparedStatement.setString(1,shippedDate);
            preparedStatement.setInt(2,order_id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
//    public static void main(String[] args) {
//        OrderServices orderServices=new OrderServices();
//        orderServices.updateOrderShippedDate("2020-06-29",81);
//    }
}
