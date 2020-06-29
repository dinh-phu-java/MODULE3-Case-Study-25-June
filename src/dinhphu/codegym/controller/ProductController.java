package dinhphu.codegym.controller;

import dinhphu.codegym.model.Post;
import dinhphu.codegym.model.Product;
import dinhphu.codegym.model.User;
import dinhphu.codegym.services.DatabaseConnection;
import dinhphu.codegym.services.IUserServices;
import dinhphu.codegym.services.ProductServices;
import dinhphu.codegym.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

@WebServlet(name = "ProductController",urlPatterns="/product-controller")
@MultipartConfig
public class ProductController extends HttpServlet {

    public static final int featurePostSize = 3;
    private ProductServices productServices = new ProductServices();
    private IUserServices userServices = new UserServices();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        System.out.println(action);
        System.out.println(request.getParameter("engine_type"));
        String url = "/my_profile.jsp";
        System.out.println("action is: " + action);

        User loginUser=(User)request.getSession().getAttribute("loginUser");
        if (action == null) {
            action = "views";
        }
        switch (action) {
            case "add-car":

                String imagePath= uploadImage(request,response,loginUser.getUserName());

                addCar(request,response,imagePath);
                break;
            case "edit-car":
                String editImagePath= uploadImage(request,response,loginUser.getUserName());
                editCar(request,response,editImagePath);
                break;
        }

    }


    private void addCar(HttpServletRequest request, HttpServletResponse response,String imagePath) {
        System.out.println("hello add car");
        String engine_type = request.getParameter("engine_type");
        String gear = request.getParameter("gear");
        String front_wheel = request.getParameter("front-wheel");
        String fuel_type = request.getParameter("fuel-type");
        String valves = request.getParameter("valves");

        String description = request.getParameter("description");
        String date_of_manufacture = request.getParameter("date_of_manufacture");
        String vendor = request.getParameter("vendor");
        String car_type = request.getParameter("car_type");
        String car_name = request.getParameter("car_name");

        String url = "/add_car.jsp";
        ArrayList<String> messages = new ArrayList<>();
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        String numberRegex = "^\\d[\\d]{1,10}[\\.]?[\\d]{1,5}";
        boolean checkNumberBoolean = Pattern.matches(numberRegex, request.getParameter("price"));
        if (checkNumberBoolean) {

            double price = Double.parseDouble(request.getParameter("price"));

            Date postDate= new Date();

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = formatter.format(postDate);
            Product car = new Product(0, loginUser.getId(), imagePath, engine_type, gear, front_wheel, fuel_type, valves, price, description, strDate, date_of_manufacture, vendor, car_type, car_name);

            if (productServices.insertProduct(car, loginUser.getId())) {
                messages.add("Add Car Completed!");
            } else {
                messages.add("Can't add car");
            }
        } else {
            messages.add("Price should be a number!");
        }

        request.setAttribute("messages", messages);
        try {
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void editCar(HttpServletRequest request, HttpServletResponse response,String imagePath) {
        System.out.println("hello edit car");
        int editCarId=Integer.parseInt(request.getParameter("editCarId")) ;
        String engine_type = request.getParameter("engine_type");
        String gear = request.getParameter("gear");
        String front_wheel = request.getParameter("front-wheel");
        String fuel_type = request.getParameter("fuel-type");
        String valves = request.getParameter("valves");

        String description = request.getParameter("description");
        String date_of_manufacture = request.getParameter("date_of_manufacture");
        String vendor = request.getParameter("vendor");
        String car_type = request.getParameter("car_type");
        String car_name = request.getParameter("car_name");

        String url = "/edit-car.jsp";
        ArrayList<String> messages = new ArrayList<>();
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        String numberRegex = "^\\d[\\d]{1,10}[\\.]?[\\d]{1,5}";
        boolean checkNumberBoolean = Pattern.matches(numberRegex, request.getParameter("price"));
        if (checkNumberBoolean) {

            double price = Double.parseDouble(request.getParameter("price"));

            Date postDate= new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = formatter.format(postDate);
            Product car = new Product(0, loginUser.getId(), imagePath, engine_type, gear, front_wheel, fuel_type, valves, price, description, strDate, date_of_manufacture, vendor, car_type, car_name);

            if (productServices.editProduct(car, editCarId)) {
                messages.add("Edit Car Completed!");
            } else {
                messages.add("Can't edit car");
            }
        } else {
            messages.add("Price should be a number!");
        }

        request.setAttribute("messages", messages);
        try {
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private String uploadImage(HttpServletRequest request, HttpServletResponse response, String userName) throws ServletException {
        String correctFile = "";
        try {
            String SAVE_DIRECTORY = userName;
            String appPath = "D:\\CodeGym\\Module3\\layout case study\\web\\upload_file";

            appPath = appPath.replace('\\', '/');
            System.out.println(appPath);

            // Thư mục để save file tải lên.
            String fullSavePath = null;
            if (appPath.endsWith("/")) {
                fullSavePath = appPath + SAVE_DIRECTORY;
            } else {
                fullSavePath = appPath + "/" + SAVE_DIRECTORY;
            }

            // Tạo thư mục nếu nó không tồn tại.
            File fileSaveDir = new File(fullSavePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            // Danh mục các phần đã upload lên (Có thể là nhiều file).
            String imgPath = "";
            String fileName = "";
            for (Part part : request.getParts()) {
                fileName = extractFileName(part);
//                System.out.println(fileName);
//                request.setAttribute("fileName",fileName);
                if (fileName != null && fileName.length() > 0) {
                    String filePath = fullSavePath + File.separator + fileName;
                    imgPath = filePath;
//                    System.out.println("Write attachment to file: " + filePath);
                    // Ghi vào file.
                    part.write(filePath);
                }
            }
            imgPath = imgPath.replace('\\', '/');

            String subFileName = imgPath.substring(imgPath.lastIndexOf('/') + 1, imgPath.length());
            System.out.println("sub file name is: " + subFileName);
            correctFile = "/upload_file/"+userName+"/" + subFileName;
            System.out.println("correct file Name:" + correctFile);

            // Upload thành công.

        } catch (Exception e) {
            e.printStackTrace();
        }
        return correctFile;
    }

    public static void insertImage(String url) throws SQLException, ClassNotFoundException {
        Connection connection = DatabaseConnection.getConnection();
        String sqlStatement = "insert into car_image_table(image1) values(?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
        preparedStatement.setString(1, url);

        preparedStatement.executeUpdate();
    }

    public int getRowImage() {
        Connection connection = DatabaseConnection.getConnection();
        String sqlStatement = "select count(*) as count from car_image_table";
        int imageRowCount = -1;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                imageRowCount = rs.getInt("count");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return imageRowCount;
    }

    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        int detailCarId=Integer.parseInt(request.getParameter("car-id"));
        HttpSession session =request.getSession();
        session.setAttribute("detailCarId",detailCarId);
        String url="/home";
        if (action ==null){
            action="views";
        }
        switch(action){
            case "car-detail":
                url="/car-detail.jsp";
                getDetailCar(request,response,detailCarId);
                break;
        }

        getServletContext().getRequestDispatcher(url).forward(request,response);
    }

    private void getDetailCar(HttpServletRequest request, HttpServletResponse response,int detailCarId) {
        HttpSession session=request.getSession();
        Product detailProduct=productServices.selectProductByCarId(detailCarId);
        User ownerUser=userServices.selectUserByCarId(detailProduct.getUser_id());
        ArrayList<Post> featureProducts=new ArrayList<>(productServices.selectRecentProduct(featurePostSize));
        ArrayList<Post> ownerProducts=new ArrayList<>(productServices.selectPostByUserId(ownerUser.getId()));

        session.setAttribute("featureProducts",featureProducts);
        session.setAttribute("ownerProducts",ownerProducts);
        session.setAttribute("detailProduct",detailProduct);
        session.setAttribute("ownerUser",ownerUser);

    }
}

