package dinhphu.codegym.controller;

import dinhphu.codegym.model.Post;
import dinhphu.codegym.model.Product;
import dinhphu.codegym.model.User;
import dinhphu.codegym.services.IProductServices;
import dinhphu.codegym.services.IUserServices;
import dinhphu.codegym.services.ProductServices;
import dinhphu.codegym.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MainController",urlPatterns={"/home","/register-user"})
public class MainController extends HttpServlet {
    private static IUserServices userServices= new UserServices();
    private static IProductServices productServices=new ProductServices();
    private static final int recentPostSize=8;
    private static final int featurePostSize=3;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        String action=request.getParameter("action");
        String url="/home.jsp";
        System.out.println(action);
        if (action==null){
            action="";
        }
        switch (action){
            case "login":
                url="/home.jsp";
                User loginUser=userServices.selectUser(username);
                session.setAttribute("loginUser",loginUser);
                break;
            case "edit-profile":
                url="/my-profile.jsp";
                break;
            default:
                url="/home.jsp";
                ArrayList<Post> recentProducts=new ArrayList<>(productServices.selectRecentProduct(recentPostSize)) ;
                request.setAttribute("recentProducts",recentProducts);
                break;
        }

        getServletContext().getRequestDispatcher(url).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        String url="/views/home.jsp";

        if (action==null){
            action="view";
        }
        switch (action){
            case "register-user":
                url="/register-user.jsp";
                break;
            case "login":
                url="/login.jsp";
                break;
            case "owner-car-list":
                url="/owner-car-list.jsp";
                showOwnerCarList(request,response);
                break;
            case "all-post":
                url="/all-post.jsp";
                showAllPost(request,response);
                break;
            case "search-post":
                url="/search-post.jsp";
                showSearchPost(request,response);
                break;
            case "search-post1":
                url="/search-post.jsp";
                showSearchPost1(request,response);
                break;
            default:
                url="/home.jsp";
                ArrayList<Post> recentProducts=new ArrayList<>(productServices.selectRecentProduct(recentPostSize)) ;
                ArrayList<Post> featureProducts=new ArrayList<>(productServices.selectRecentProduct(featurePostSize));
                request.setAttribute("recentProducts",recentProducts);
                request.setAttribute("featureProducts",featureProducts);
                break;
        }
        getServletContext().getRequestDispatcher(url).forward(request,response);
    }

    private void showSearchPost1(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        int page=Integer.parseInt(request.getParameter("page"));
        final int numberProductPerPage=4;
        String car_name=(String)session.getAttribute("car_name");
        String location=(String)session.getAttribute("location");
        String car_type=(String)session.getAttribute("car_type");

        ArrayList<Post> allList=new ArrayList<>(productServices.selectSearchProduct(car_name,location,car_type));
        ArrayList<Post> productList=new ArrayList<>();
        double listSize= (Math.ceil(allList.size()/numberProductPerPage))+1;

        int startElement= (page-1)*numberProductPerPage;
        for (int i =startElement; i<startElement+numberProductPerPage && i<allList.size();i++){
            productList.add(allList.get(i));
        }
        session.setAttribute("car_name",car_name);
        session.setAttribute("location",location);
        session.setAttribute("car_type",car_type);
        session.setAttribute("page",page);
        session.setAttribute("listSize",listSize);
        session.setAttribute("productList",productList);
    }

    private void showSearchPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        int page=Integer.parseInt(request.getParameter("page"));
        final int numberProductPerPage=4;

        String car_name="%"+request.getParameter("car_name").trim()+"%";
        String location=request.getParameter("location").trim();
        String car_type="%"+request.getParameter("car_type").trim()+"%";

        ArrayList<Post> allList=new ArrayList<>(productServices.selectSearchProduct(car_name,location,car_type));
        ArrayList<Post> productList=new ArrayList<>();
        double listSize= (Math.ceil(allList.size()/numberProductPerPage))+1;

        int startElement= (page-1)*numberProductPerPage;
        for (int i =startElement; i<startElement+numberProductPerPage && i<allList.size();i++){
            productList.add(allList.get(i));
        }
        session.setAttribute("car_name",car_name);
        session.setAttribute("location",location);
        session.setAttribute("car_type",car_type);
        session.setAttribute("page",page);
        session.setAttribute("listSize",listSize);
        session.setAttribute("productList",productList);
    }

    private void showAllPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        int page=Integer.parseInt(request.getParameter("page"));
        final int numberProductPerPage=4;


        ArrayList<Post> allList=new ArrayList<>(productServices.selectAllProduct());
        ArrayList<Post> productList=new ArrayList<>();
        double listSize= (Math.ceil(allList.size()/numberProductPerPage))+1;

        int startElement= (page-1)*numberProductPerPage;
        for (int i =startElement; i<startElement+numberProductPerPage && i<allList.size();i++){
            productList.add(allList.get(i));
        }

        session.setAttribute("page",page);
        session.setAttribute("listSize",listSize);
        session.setAttribute("productList",productList);
    }

    private void showOwnerCarList(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();

        int page=Integer.parseInt(request.getParameter("page"));
        final int numberProductPerPage=4;

        int ownerUserId=Integer.parseInt(request.getParameter("user-id")) ;
        User ownerUser=(User)userServices.selectUserByUserId(ownerUserId);

        ArrayList<Product> allList=new ArrayList<>(productServices.selectProductByUserId(ownerUser.getId()));
        ArrayList<Product> productList=new ArrayList<>();

        double listSize= (Math.ceil(allList.size()/numberProductPerPage))+1;
        int startElement= (page-1)*numberProductPerPage;

        for (int i =startElement; i<startElement+numberProductPerPage && i<allList.size();i++){
            productList.add(allList.get(i));
        }

        session.setAttribute("ownerUser",ownerUser);
        session.setAttribute("page",page);
        session.setAttribute("listSize",listSize);
        session.setAttribute("productList",productList);
    }
}
