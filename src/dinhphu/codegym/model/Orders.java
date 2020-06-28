package dinhphu.codegym.model;

public class Orders {
    int order_id;
    int buyer_id;
    String order_date;
    String shipped_date;

    public Orders(int order_id, int buyer_id, String order_date, String shipped_date) {
        this.order_id = order_id;
        this.buyer_id = buyer_id;
        this.order_date = order_date;
        this.shipped_date = shipped_date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(int buyer_id) {
        this.buyer_id = buyer_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getShipped_date() {
        return shipped_date;
    }

    public void setShipped_date(String shipped_date) {
        this.shipped_date = shipped_date;
    }
}
