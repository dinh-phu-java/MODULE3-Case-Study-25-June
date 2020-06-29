package dinhphu.codegym.controller;

import dinhphu.codegym.model.OrderDetail;
import dinhphu.codegym.services.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "AdminController",urlPatterns="/admin-controller")
public class AdminController extends HttpServlet {
    private static IOrders orderServices=new OrderServices();
    private static IProductServices productServices=new ProductServices();
    private static IOrderDetail orderDetailServices=new OrderDetailServices();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        String url="/home";
        if (action==null){
            action="views";
        }

        switch (action){
            case "confirm-order":
                confirmOrder(request,response);
                url="/admin-page.jsp";
                break;
        }

        getServletContext().getRequestDispatcher(url).forward(request,response);
    }

    private void confirmOrder(HttpServletRequest request, HttpServletResponse response) {
        int order_id =Integer.parseInt(request.getParameter("order-id"));
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        String shipped_date = simpleDateFormat.format(new Date());
        orderServices.updateOrderShippedDate(shipped_date,order_id);

        ArrayList<OrderDetail> orderDetails=new ArrayList<>(orderDetailServices.selectOrderDetailsByOrderId(order_id));

        for(OrderDetail detail : orderDetails){
            productServices.updateProductStatusToComplete(detail.getCar_id());
        }
    }
}
