package dinhphu.codegym.controller;

import dinhphu.codegym.model.*;
import dinhphu.codegym.services.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.regex.Pattern;

@WebServlet(name = "UserController",urlPatterns = {"/user-action","/user-control"})
public class UserController extends HttpServlet {
    private static IUserServices userServices=new UserServices();
    private static IProductServices productServices=new ProductServices();
    public static  ICart cartServices=new CartServices();
    public static IOrders orderServices=new OrderServices();
    public static IOrderDetail orderDetailServices=new OrderDetailServices();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        String url="/home.jsp";

        if (action==null){
            action="view";
            getServletContext().getRequestDispatcher(url).forward(request,response);
        }
        switch(action){
            case "register":
                registerUser(request,response);
                break;
            case "login":
                ArrayList<Post> recentProducts=new ArrayList<>(productServices.selectRecentProduct()) ;
                request.setAttribute("recentProducts",recentProducts);
                loginUser(request,response);
                break;
            case "edit-profile":
               editUser(request,response);
                break;
            case "change-password":
                changePassword(request,response);
                break;
            case "buy-item":
                buyItems(request,response);
                break;
        }


    }

    private void buyItems(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        User buyer=(User)session.getAttribute("loginUser");
        double totalPrice=Double.parseDouble(request.getParameter("total_price"));

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String order_date = format.format(new Date());
        orderServices.createOrder(buyer.getId(),order_date);
        int order_id= orderServices.getLastRecord();

        ArrayList<Cart> cartList= new ArrayList<>(cartServices.selectAllCartByLoginUser(buyer.getId()));
        ArrayList<Post> postList= new ArrayList<>();
        for (Cart cart:cartList){
            postList.add(productServices.selectPostByCarId(cart.getCar_id()));
        }
        for (Post post:postList){
            orderDetailServices.createOrderDetail(order_id,post.getUser_id(),post.getCar_id(),post.getCar_price());
        }
        cartServices.deleteAllCart(buyer.getId());
        session.removeAttribute("postList");
        ArrayList<Orders> ordersList= new ArrayList<>(orderServices.selectOrdersByBuyerId(buyer.getId()));

        for (Orders order : ordersList){
            if (order.getShipped_date() == null){
                order.setShipped_date("Delivering");
            }else{
                order.setShipped_date("Completed");
            }
        }

        session.setAttribute("orderList",ordersList);
        String url="/order-list.jsp";
        try {
            getServletContext().getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        ArrayList<Post> posts=session.getAttribute("postList");
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) {
        String currentPassword=request.getParameter("currentPassword");
        String hashPassword= PasswordUtil.hashPassword(currentPassword);
        String newPassword=request.getParameter("newPassword");
        String confirmNewPassword=request.getParameter("confirmNewPassword");
        HttpSession session=request.getSession();
        User loginUser=(User)session.getAttribute("loginUser");
        String username=loginUser.getUserName();
        ArrayList<User> allUser=new ArrayList<>(userServices.selectAllUser()) ;
        ArrayList<String> message=new ArrayList<>();
        boolean findUser=false;
        for (User user:allUser){
            if (username.equals(user.getUserName()) && hashPassword.equals(user.getPassword())){
                findUser=true;
                break;
            }
        }

        if (findUser){

            String passwordExpression= "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
            Boolean passwordCheck= Pattern.matches(passwordExpression,newPassword);
            if (passwordCheck && (newPassword.equals(confirmNewPassword))){
                String hashNewPassword= PasswordUtil.hashPassword(newPassword);
                if (userServices.updatePassword(loginUser,hashNewPassword)){
                    message.add("Edit password Completed!");
                }else{
                    message.add("Can't edit password!");
                }

            }else{
                message.add("Password length must be at least 8 characters and include upper,lower,digit and special character");
                message.add("new Password is not match!");
            }

        }else{
            message.add("Current password is not correct!");
        }

        request.setAttribute("message",message);
        String url="/change_password.jsp";
        try {
            getServletContext().getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        String fullName=request.getParameter("fullName");
        String address=request.getParameter("address");
        HttpSession session=request.getSession();
        User sessionUser=(User)session.getAttribute("loginUser");
        boolean editBoolean=false;
        User editUser=null;
        ArrayList<String> message=new ArrayList<>();
        String url="/home.jsp";
        String action="";

        if (fullName.equals("") || address.equals("") || fullName ==null || address==null){
            message.add("Name or Address can't be null");
        }else{
            editUser=new User(sessionUser.getId(),fullName.trim(),sessionUser.getUserName(),sessionUser.getEmail(),sessionUser.getPassword(),address.trim());
            editBoolean=userServices.editUser(editUser);
        }


        if (editBoolean){
            message.add("Edit user Completed!");
            url="/home";
            action=request.getParameter("action");
            session.setAttribute("loginUser",editUser);
        }else{
            message.add("Can't edit user!");
            action=request.getParameter("action");
            url="/home";
        }
        try {
            request.setAttribute("message",message);
            request.setAttribute("action",action);
            getServletContext().getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) {
        String userName= request.getParameter("userName");
        String password=request.getParameter("password");

        String emailExpression="[\\w\\d]*[\\.\\w\\d]*@[\\w]*[\\.\\w](.com||.vn||.org)";
        String userNameExpression="^\\w[\\w\\d]{1,19}";

        Boolean emailCheck= Pattern.matches(emailExpression,userName);
        Boolean userCheck=Pattern.matches(userNameExpression,userName);

        String passwordExpression= "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        Boolean passwordCheck= Pattern.matches(passwordExpression,password);

        String hashPassword= PasswordUtil.hashPassword(password);
        ArrayList<String> message= new ArrayList<>();
        String url="/login.jsp";
        if ((userCheck || emailCheck) && passwordCheck){
            ArrayList<User> userList=new ArrayList<>(userServices.selectAllUser());
            boolean userMatch=false;
            for (User user : userList){
                if ( (user.getEmail().equalsIgnoreCase(userName) || user.getUserName().equalsIgnoreCase(userName)) && user.getPassword().equalsIgnoreCase(hashPassword)){
                    userMatch=true;
                    break;
                }
            }
            if (userMatch){
                message.add("Login successfully!");
                url="/home";
                request.setAttribute("action","view");
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(-1);
                session.setAttribute("username",userName);
            }else{
                message.add("User name or password is not correct");
                url="/login.jsp";
            }
        }else{
            message.add("User name or password format is not correct");
            url="/login.jsp";
        }

        request.setAttribute("message",message);
        try {
            getServletContext().getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) {

        String fullName=request.getParameter("fullName");
        String userName=request.getParameter("userName");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String repeat_password=request.getParameter("repeat_password");
        String address=request.getParameter("address");
        //check email
        String emailExpression="[\\w\\d]*[\\.\\w\\d]*@[\\w]*[\\.\\w](.com||.vn||.org)";
        Boolean emailCheck= Pattern.matches(emailExpression,email);
        //check username
        String userNameExpression="^\\w[\\w\\d]{1,19}";
        Boolean userCheck=Pattern.matches(userNameExpression,userName);
        // check password
        String passwordExpression= "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        boolean passwordCheck= password.equals(repeat_password);
        Boolean passwordCheckExpression= Pattern.matches(passwordExpression,password);

        ArrayList<String> message=new ArrayList<>();
        String url="/register-user.jsp";
        if (emailCheck && userCheck && passwordCheck && passwordCheckExpression){
            //thuc hien dang ky

            int rowCount=userServices.rowCount();
            int userId=rowCount+1;
            User insertUser= new User(userId,fullName,userName,email,password,address);
            if (rowCount==0){
                //insert luon
                if(userServices.insertUser(insertUser)) {
                    message.add("Inserted User Completed");
                }else{
                    message.add("Can't insert user");
                }
                url="/thanks.jsp";
            }else{
                //kiem tra ko co moi insert
                ArrayList<User>  existUserList=new ArrayList<>(userServices.selectAllUser());
                boolean checkDuplicateUser=false;
                for (User user : existUserList) {
                    if (email.equalsIgnoreCase(user.getEmail()) || userName.equals(user.getUserName())){
                        if (email.equalsIgnoreCase(user.getEmail())){
                            message.add("Email already in use!");
                        }
                        if (userName.equalsIgnoreCase(user.getUserName())){
                            message.add("user name already exists");
                        }
                        checkDuplicateUser=true;
                        break;
                    }
                }

                if (!checkDuplicateUser){
                    if (userServices.insertUser(insertUser)){
                        message.add("Inserted User Completed");
                    }else{
                        message.add("Can't insert user");
                    }
                }
                url="/thanks.jsp";
            }
        }else{
            if (!emailCheck){
                message.add("Email incorrect!");
            }
            if (!userCheck){
                message.add("user name only contain lower case and digit");
            }
            if (!passwordCheck){
                message.add("Password is not match");
            }
            if(!passwordCheckExpression){
                message.add("Password length must be at least 8 characters and include upper,lower,digit and special character");
            }
        }


        request.setAttribute("message",message);
        try {
            getServletContext().getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action= request.getParameter("action");
            String url="/home.jsp";
            System.out.println(action);
            if (action==null){
                action="views";
            }
        HttpSession session=request.getSession();
            switch (action){
                case "user-profile":
                    url="/my-profile.jsp";
                    break;
                case "user-logout":
                    url="/home";
                    request.setAttribute("action","view");
                    session.removeAttribute("username");
                    session.removeAttribute("loginUser");
                    break;
                case "change-password":
                    url="/change_password.jsp";
                    break;
                case "my-car-list":
                    url="/my-car-list.jsp";
                    showUserCarList(request,response);
                    break;
                case "add-car":
                    url="/add_car.jsp";
                    break;
                case "edit-car":
                    url="/edit-car.jsp";
                    showUserEditCar(request,response);
                    break;
                case "add-to-cart":
                    url="/car-detail.jsp";
                    addToCart(request,response);
                    break;
                case "cart-list":
                    url="/my-cart-list.jsp";
                    showCartList(request,response);
                    break;
                case "remove-cart":
                    url="/my-cart-list.jsp";
                    removeCart(request,response);
                    showCartList(request,response);
                    break;
            }
        System.out.println("url is: "+url);
            getServletContext().getRequestDispatcher(url).forward(request,response);

    }

    private void removeCart(HttpServletRequest request, HttpServletResponse response) {
        int car_id=Integer.parseInt(request.getParameter("car-id"));
        User loginUser= (User)request.getSession().getAttribute("loginUser");
        cartServices.removeCart(loginUser.getId(),car_id);
    }

    private void showCartList(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        double totalPrice=0;

        User loginUser=(User) session.getAttribute("loginUser");
        ArrayList<Cart> cartList= new ArrayList<>(cartServices.selectAllCartByLoginUser(loginUser.getId()));
        ArrayList<Post> postList= new ArrayList<>();

        for (Cart cart:cartList){
            postList.add(productServices.selectPostByCarId(cart.getCar_id()));
        }
        for (Post post:postList){
            totalPrice+=post.getCar_price();
        }

        totalPrice=Double.parseDouble(new DecimalFormat("##.##").format(totalPrice));
        session.setAttribute("totalPrice",totalPrice);
        session.setAttribute("postList",postList);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
        int car_id= Integer.parseInt(request.getParameter("car-id"));
        HttpSession session=request.getSession();
        User loginUser=(User)session.getAttribute("loginUser");
        cartServices.insertCart(loginUser.getId(),car_id);

        ArrayList<Cart> cartList= new ArrayList<>(cartServices.selectAllCartByLoginUser(loginUser.getId()));
        session.setAttribute("cartList",cartList);
    }

    private void showUserEditCar(HttpServletRequest request, HttpServletResponse response) {
        int editCarId=Integer.parseInt(request.getParameter("car-id"));
        Product editCar=productServices.selectProductByCarId(editCarId);
        request.setAttribute("editCar",editCar);
        System.out.println(editCar.getCar_name());
    }

    private void showUserCarList(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        int page=Integer.parseInt(request.getParameter("page"));
        final int numberProductPerPage=4;
        User loginUser=(User)session.getAttribute("loginUser");
        ArrayList<Product> allList=new ArrayList<>(productServices.selectProductByUserId(loginUser.getId()));
        ArrayList<Product> productList=new ArrayList<>();
        double listSize= (Math.ceil(allList.size()/numberProductPerPage))+1;

        int startElement= (page-1)*numberProductPerPage;
        for (int i =startElement; i<startElement+numberProductPerPage && i<allList.size();i++){
            productList.add(allList.get(i));
        }

        session.setAttribute("page",page);
        session.setAttribute("listSize",listSize);
        session.setAttribute("productList",productList);
    }


}
