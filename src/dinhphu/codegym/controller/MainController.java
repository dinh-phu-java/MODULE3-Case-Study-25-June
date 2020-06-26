package dinhphu.codegym.controller;

import dinhphu.codegym.model.User;
import dinhphu.codegym.services.IUserServices;
import dinhphu.codegym.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "MainController",urlPatterns={"/home","/register-user"})
public class MainController extends HttpServlet {
    private static IUserServices userServices= new UserServices();
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
                url="/my_profile.jsp";
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
                url="/register_user.jsp";
                break;
            case "login":
                url="/login.jsp";
                break;
            default:
                url="/editors.jsp";
                break;
        }
        getServletContext().getRequestDispatcher(url).forward(request,response);
    }
}
