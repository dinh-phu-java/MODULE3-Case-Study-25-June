package dinhphu.codegym.services;

public interface ICart {
    public void insertCart(int user_id, int car_id);
    public void deleteAllCart(int user_id);
    public void removeCart(int cart_id);
}
