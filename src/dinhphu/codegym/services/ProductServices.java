package dinhphu.codegym.services;

import dinhphu.codegym.model.Post;
import dinhphu.codegym.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductServices implements IProductServices {
    private static final String selectAllPost = "select c.car_id,c.user_id,c.image_id,c.engine_type,c.gear, c.front_wheel,c.fuel_type,c.valves,c.car_price,c.description,c.post_date,c.date_of_manufacture,c.vendor,c.car_type,c.car_name,u.username,u.full_name,u.address from car as c inner join users as u on c.user_id = u.user_id";
    private static final String selectSearchPost = "select c.car_id,c.user_id,c.image_id,c.engine_type,c.gear, c.front_wheel,c.fuel_type,c.valves,c.car_price,c.description,c.post_date,c.date_of_manufacture,c.vendor,c.car_type,c.car_name,u.username,u.full_name,u.address from car as c inner join users as u on c.user_id=u.user_id where (c.car_name like ? or c.car_type = ? or u.address like ?) and c.status='available'";
    private static final String selectPostByCarId = "select c.car_id,c.user_id,c.image_id,c.engine_type,c.gear, c.front_wheel,c.fuel_type,c.valves,c.car_price,c.description,c.post_date,c.date_of_manufacture,c.vendor,c.car_type,c.car_name,u.username,u.full_name,u.address from car as c inner join users as u on c.user_id = u.user_id where c.car_id=?";
    private static final String selectRecentProduct = "select c.car_id,c.user_id,c.image_id,c.engine_type,c.gear, c.front_wheel,c.fuel_type,c.valves,c.car_price,c.description,c.post_date,c.date_of_manufacture,c.vendor,c.car_type,c.car_name,u.username,u.full_name,u.address from car as c inner join users as u on c.user_id = u.user_id where c.status='available' order by car_id desc limit ?";
    private static final String selectPostByUserId = "select c.car_id,c.user_id,c.image_id,c.engine_type,c.gear, c.front_wheel,c.fuel_type,c.valves,c.car_price,c.description,c.post_date,c.date_of_manufacture,c.vendor,c.car_type,c.car_name,u.username,u.full_name,u.address from car as c inner join users as u on c.user_id = u.user_id where c.status='available' and c.user_id=? order by car_id desc limit 3";
    private static final String insertProductStatement = "insert into car(engine_type,gear,front_wheel,fuel_type,valves,car_price,description,post_date,date_of_manufacture,vendor,car_type,car_name,user_id,image_id) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String updateProduct = "update car set image_id=?, engine_type = ?,gear=? , front_wheel=?, fuel_type=?,valves=?, car_price=?, description=?, vendor=?, car_type=?, car_name=? where car_id=?";
    private static final String selectProductByUserId = "select * from car where user_id=? and status='available'";
    private static final String updateCarStatusDelivering = "update car set status='delivering' where car_id = ? and user_id=?";
    private static final String getTotalPrice = "select sum(price_manual) from order_detail where order_id=?";
    private static final String updateStatusToComplete = "update car set status='completed' where car_id = ?";
    private static final String selectSoldProduct = "select * from car where user_id=? and status <> 'available' order by car_id desc";

    @Override
    public double getTotalPrice(int order_id){
        Connection connection=DatabaseConnection.getConnection();
        double totalPrice=0;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(getTotalPrice);
            preparedStatement.setInt(1,order_id);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                totalPrice=rs.getDouble(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return totalPrice;
    }
    @Override
    public void updateCarStatusDelivering(int car_id,int seller_id){
        Connection connection =DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(updateCarStatusDelivering);
            preparedStatement.setInt(1,car_id);
            preparedStatement.setInt(2,seller_id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean insertProduct(Product product, int userId) {
        Connection connection = DatabaseConnection.getConnection();
        boolean insertRow = false;
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(insertProductStatement);
            preparedStatement.setString(1, product.getEngine_type());
            preparedStatement.setString(2, product.getGear());
            preparedStatement.setString(3, product.getFront_wheel());
            preparedStatement.setString(4, product.getFuel_type());
            preparedStatement.setString(5, product.getValves());
            preparedStatement.setDouble(6, product.getCar_price());
            preparedStatement.setString(7, product.getDescription());
            preparedStatement.setString(8, product.getPost_date());
            preparedStatement.setString(9, product.getDate_of_manufacture());
            preparedStatement.setString(10, product.getVendor());
            preparedStatement.setString(11, product.getCar_type());
            preparedStatement.setString(12, product.getCar_name());
            preparedStatement.setInt(13, userId);
            preparedStatement.setString(14, product.getImage_id());

            insertRow = preparedStatement.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return insertRow;
    }

    @Override
    public boolean editProduct(Product product,int carId) {
        Connection connection = DatabaseConnection.getConnection();
        boolean updateRow = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(updateProduct);
            preparedStatement.setString(1, product.getImage_id());
            preparedStatement.setString(2, product.getEngine_type());
            preparedStatement.setString(3, product.getGear());
            preparedStatement.setString(4, product.getFront_wheel());
            preparedStatement.setString(5, product.getFuel_type());
            preparedStatement.setString(6, product.getValves());
            preparedStatement.setDouble(7, product.getCar_price());
            preparedStatement.setString(8, product.getDescription());
            preparedStatement.setString(9, product.getVendor());
            preparedStatement.setString(10, product.getCar_type());
            preparedStatement.setString(11, product.getCar_name());
            preparedStatement.setInt(12, carId);

            updateRow = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updateRow;
    }

    @Override
    public Product selectProduct(String token) {
        return null;
    }

    @Override
    public int rowCount() {
        return 0;
    }

    @Override
    public List<Post> selectAllProduct() {
        ArrayList<Post> posts = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectAllPost);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                Post post=new Post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18));
                posts.add(post);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return posts;

    }

    @Override
    public List<Post> selectSearchProduct(String name,String carType,String address ){
        ArrayList<Post> posts = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectSearchPost);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,carType);
            preparedStatement.setString(3,address);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                Post post=new Post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18));
                posts.add(post);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return posts;

    }

    @Override
    public List<Product> selectProductByUserId(int userId) {
        ArrayList<Product> products = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement sqlStatement = connection.prepareStatement(selectProductByUserId);
            sqlStatement.setInt(1, userId);
            ResultSet rs = sqlStatement.executeQuery();
            while (rs.next()) {

                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

             Product getProduct=new Product(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15));
             products.add(getProduct);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return products;
    }

    @Override
    public Product selectProductByCarId(int carId){
        Connection connection=DatabaseConnection.getConnection();
        String sqlStatement="select * from car where car_id=?";
        Product product=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sqlStatement);
            preparedStatement.setInt(1,carId);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                product=new Product(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return product;
    }

    @Override
    public List<Post> selectRecentProduct(int size){
        ArrayList<Post> posts = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectRecentProduct);
            preparedStatement.setInt(1,size);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                Post post=new Post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18));
                posts.add(post);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return posts;
    }
    @Override
    public List<Post> selectPostByUserId(int user_id){
        ArrayList<Post> posts = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectPostByUserId);
            preparedStatement.setInt(1,user_id);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                Post post=new Post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18));
                posts.add(post);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return posts;
    }

    @Override
    public Post selectPostByCarId(int carId){
        Post post = null;
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(selectPostByCarId);
            preparedStatement.setInt(1,carId);
            ResultSet rs=preparedStatement.executeQuery();
            while(rs.next()){
                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                 post=new Post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return post;
    }

    @Override
    public void updateProductStatusToComplete(int car_id){
            Connection connection=DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(updateStatusToComplete);
            preparedStatement.setInt(1,car_id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    @Override
    public List<Product> selectSoldProduct(int userId){

        ArrayList<Product> products = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement sqlStatement = connection.prepareStatement(selectSoldProduct);
            sqlStatement.setInt(1, userId);
            ResultSet rs = sqlStatement.executeQuery();
            while (rs.next()) {

                double number =rs.getDouble(9);
                double carPrice =Double.parseDouble(new DecimalFormat("##.##").format(number));

                String gear=rs.getString(5).toUpperCase();
                String front_wheel=rs.getString(6).toUpperCase();
                String fuel_type=rs.getString(7).toUpperCase();

                Product getProduct=new Product(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),gear,front_wheel,fuel_type,rs.getString(8),carPrice,rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16));
                products.add(getProduct);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return products;

    }
//    public static void main(String[] args) {
//
//        ProductServices productServices=new ProductServices();
//        System.out.println(productServices.getTotalPrice(19)) ;
//
//    }
}
