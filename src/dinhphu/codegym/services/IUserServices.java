package dinhphu.codegym.services;

import dinhphu.codegym.model.User;

import java.util.List;

public interface IUserServices {
    public boolean insertUser(User user);
    public boolean editUser(User user);
    public User selectUser(String token);
    public int rowCount();
    public List<User> selectAllUser();
    public boolean updatePassword(User user , String newPassword);
}
