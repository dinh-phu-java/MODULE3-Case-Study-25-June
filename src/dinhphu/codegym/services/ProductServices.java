package dinhphu.codegym.services;

import dinhphu.codegym.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ProductServices implements IProductServices {
    private static final String selectAllProductStatement="select * from car";
    private static final String insertProductStatement="insert into car(engine_type,gear,front_wheel,fuel_type,valves,car_price,description,post_date,date_of_manufacture,vendor,car_type,car_name,user_id,image_id) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String updateProduct="update users set full_name=?, address = ? where username=?";

    @Override
    public boolean insertProduct(Product product,int userId) {
        Connection connection= DatabaseConnection.getConnection();
        boolean insertRow=false;
        try {

            PreparedStatement preparedStatement=connection.prepareStatement(insertProductStatement);
            preparedStatement.setString(1,product.getEngine_type());
            preparedStatement.setString(2,product.getGear());
            preparedStatement.setString(3,product.getFront_wheel());
            preparedStatement.setString(4,product.getFuel_type());
            preparedStatement.setString(5, product.getValves());
            preparedStatement.setDouble(6,product.getCar_price());
            preparedStatement.setString(7,product.getDescription());
            preparedStatement.setString(8,product.getPost_date());
            preparedStatement.setString(9,product.getDate_of_manufacture());
            preparedStatement.setString(10,product.getVendor());
            preparedStatement.setString(11,product.getCar_type());
            preparedStatement.setString(12,product.getCar_name());
            preparedStatement.setInt(13,userId);
            preparedStatement.setString(14,product.getImage_id());

            insertRow=preparedStatement.executeUpdate() > 0 ;

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
}
