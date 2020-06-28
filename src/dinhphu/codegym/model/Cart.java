package dinhphu.codegym.model;

public class Cart {
    int cart_id;
    int user_id;
    int car_id;

    public Cart(int cart_id, int user_id, int car_id) {
        this.cart_id = cart_id;
        this.user_id = user_id;
        this.car_id = car_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }
}
