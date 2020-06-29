package dinhphu.codegym.services;

import dinhphu.codegym.model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailServices implements IOrderDetail {
    private static final String createOrderDetail="insert into order_detail(order_id,seller_id,car_id,price_manual) value(?,?,?,?)";
    private static final String selectOrderDetailByOrderId="select * from order_detail where order_id=?";
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

    public List<OrderDetail> selectOrderDetailsByOrderId(int order_id){
        Connection connection= DatabaseConnection.getConnection();
        ArrayList<OrderDetail> list=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectOrderDetailByOrderId);
            preparedStatement.setInt(1,order_id);
            ResultSet rs=preparedStatement.executeQuery();

            while(rs.next()){
                OrderDetail detail=new OrderDetail(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getDouble(5));
                list.add(detail);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
//    public static void main(String[] args) {
//        OrderDetailServices orderDetailServices=new OrderDetailServices();
//        orderDetailServices.selectOrderDetailsByOrderId(81).forEach(k-> System.out.println(k.getPrice_manual()));
//    }
}
