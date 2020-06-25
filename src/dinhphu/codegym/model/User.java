package dinhphu.codegym.model;

public class User {
    private int id;
    private String fullName;
    private String email;
    private String userName;
    private String password;
    private String address;
    private int permission;

    public User(int id, String fullName, String userName, String email, String password,String address) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.address=address;
        this.permission=1;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
