package dinhphu.codegym.services;

import dinhphu.codegym.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductServices implements IProductServices {
    private static final String selectAllProductStatement = "select * from car";
    private static final String insertProductStatement = "insert into car(engine_type,gear,front_wheel,fuel_type,valves,car_price,description,post_date,date_of_manufacture,vendor,car_type,car_name,user_id,image_id) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String updateProduct = "update users set full_name=?, address = ? where username=?";
    private static final String selectProductByUserId = "select * from car where user_id=?";

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
    public boolean editProduct(Product product) {
        return false;
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
    public List<Product> selectAllProduct() {
        return null;
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
             Product getProduct=new Product(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getDouble(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15));
             products.add(getProduct);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return products;
    }

}
