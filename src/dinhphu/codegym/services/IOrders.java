package dinhphu.codegym.services;

import dinhphu.codegym.model.Orders;

import java.util.List;

public interface IOrders {
    public void createOrder(int buyer_id,String order_date);
    public int getLastRecord();
    public List<Orders> selectOrdersByBuyerId(int buyer_id);
    public List<Orders> selectDeliveringOrders();
}
