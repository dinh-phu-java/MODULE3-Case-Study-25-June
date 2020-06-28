package dinhphu.codegym.model;

public class OrderDetail {
    int order_detail_id;
    int order_id;
    int seller_id;
    int car_id;
    double price_manual;

    public OrderDetail(int order_detail_id, int order_id, int seller_id, int car_id, double price_manual) {
        this.order_detail_id = order_detail_id;
        this.order_id = order_id;
        this.seller_id = seller_id;
        this.car_id = car_id;
        this.price_manual = price_manual;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    public double getPrice_manual() {
        return price_manual;
    }

    public void setPrice_manual(double price_manual) {
        this.price_manual = price_manual;
    }
}
