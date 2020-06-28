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
    public List<Post> selectRecentProduct();
    public List<Product> selectProductByUserId(int userId);
    public Product selectProductByCarId(int carId);
}
