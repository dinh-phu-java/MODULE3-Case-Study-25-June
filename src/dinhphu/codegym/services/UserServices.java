package dinhphu.codegym.services;

import dinhphu.codegym.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServices implements IUserServices {

    private static final String selectAllUserStatement="select * from users";
    private static final String insertUserStatement="insert into users(user_id,full_name,username,email,password,address,permission_id) value(?,?,?,?,?,?,?)";
    private static final String updateUserProfile="update users set full_name=?, address = ? where username=?";


    @Override
    public boolean insertUser(User user) {
        Connection connection= DatabaseConnection.getConnection();
        boolean insertRow=false;
        try {
            String hashPassword= PasswordUtil.hashPassword(user.getPassword());
            PreparedStatement preparedStatement=connection.prepareStatement(insertUserStatement);
            preparedStatement.setInt(1,user.getId());
            preparedStatement.setString(2,user.getFullName());
            preparedStatement.setString(3,user.getUserName());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setString(5, hashPassword);
            preparedStatement.setString(6,user.getAddress());
            preparedStatement.setInt(7,user.getPermission());

            insertRow=preparedStatement.executeUpdate() > 0 ;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return insertRow;
    }

    @Override
    public boolean editUser(User user) {
        boolean updateRow=false;
        Connection connection= DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(updateUserProfile);
            preparedStatement.setString(1,user.getFullName());
            preparedStatement.setString(2,user.getAddress());
            preparedStatement.setString(3,user.getUserName());

            updateRow=preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updateRow;
    }

    @Override
    public User selectUser(String token) {
        Connection connection= DatabaseConnection.getConnection();
        User user=null;
        String sqlStatement= "select * from users where username = ? OR email =?";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sqlStatement);
            preparedStatement.setString(1,token);
            preparedStatement.setString(2,token);;
            ResultSet rs= preparedStatement.executeQuery();
            while (rs.next()){
                int userId= rs.getInt("user_id");
                String userName=rs.getString("username");
                String email=rs.getString("email");
                String password=rs.getString("password");
                String address=rs.getString("address");
                String fullName=rs.getString("full_name");
                int permissionId=rs.getInt("permission_id");
                user=new User(userId,fullName,userName,email,password,address);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }
    @Override
    public User selectUserByCarId(int carId){
        Connection connection= DatabaseConnection.getConnection();
        User user=null;
        String sqlStatement= "select * from users where user_id=?";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sqlStatement);
            preparedStatement.setInt(1,carId);
            ResultSet rs= preparedStatement.executeQuery();
            while (rs.next()){
                int userId= rs.getInt("user_id");
                String userName=rs.getString("username");
                String email=rs.getString("email");
                String password=rs.getString("password");
                String address=rs.getString("address");
                String fullName=rs.getString("full_name");
                int permissionId=rs.getInt("permission_id");
                user=new User(userId,fullName,userName,email,password,address);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public int rowCount(){
        int rowCount=-1;
        Connection connection= DatabaseConnection.getConnection();
        String sqlStatement = "select count(*) as row_count from users";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sqlStatement);

            ResultSet rs=preparedStatement.executeQuery();

            while(rs.next()){
                rowCount=Integer.parseInt(rs.getString("row_count"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowCount;
    }
    @Override
    public List<User> selectAllUser(){
        ArrayList<User> userList= new ArrayList<>();
        Connection connection= DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement= connection.prepareStatement(selectAllUserStatement);
            ResultSet rs= preparedStatement.executeQuery();
            while(rs.next()){
                User user=new User(rs.getInt("user_id"),rs.getString("full_name"),rs.getString("username"),rs.getString("email"),rs.getString("password"),rs.getString("address"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }
    @Override
    public boolean updatePassword(User user , String newPassword){
        boolean updatePassword=false;
        Connection connection= DatabaseConnection.getConnection();
        String sqlStatement= "update users set password=? where username=?";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sqlStatement);
            preparedStatement.setString(1,newPassword);
            preparedStatement.setString(2,user.getUserName());

            updatePassword=preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updatePassword;
    }
}
