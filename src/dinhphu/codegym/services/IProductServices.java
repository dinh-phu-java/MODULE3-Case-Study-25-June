package dinhphu.codegym.services;

import dinhphu.codegym.model.Post;
import dinhphu.codegym.model.Product;

import java.util.List;

public interface IProductServices {
    public boolean insertProduct(Product product,int userId);
    public boolean editProduct(Product product,int carId);
    public Product selectProduct(String token);
    public int rowCount();
    public List<Post> selectAllProduct();
    public List<Post> selectSearchProduct(String name,String address, String carType);
    public List<Post> selectRecentProduct(int size);
    public Post selectPostByCarId(int carId);
    public List<Product> selectProductByUserId(int userId);
    public List<Product> selectSoldProduct(int userId);
    public Product selectProductByCarId(int carId);
    public void updateCarStatusDelivering(int car_id,int seller_id);
    public double getTotalPrice(int order_id);
    public void updateProductStatusToComplete(int car_id);
}
