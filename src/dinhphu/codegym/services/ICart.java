package dinhphu.codegym.services;

import dinhphu.codegym.model.Cart;

import java.util.List;

public interface ICart {
    public void insertCart(int user_id, int car_id);
    public void deleteAllCart(int user_id);
    public void removeCart(int cart_id);
    public List<Cart> selectAllCartByLoginUser(int user_id);


}
