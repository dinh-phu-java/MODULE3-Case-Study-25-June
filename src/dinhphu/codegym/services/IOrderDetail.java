package dinhphu.codegym.services;

import dinhphu.codegym.model.OrderDetail;

public interface IOrderDetail {
    public void createOrderDetail(int order_id,int seller_id,int car_id,double price_manual);
}
