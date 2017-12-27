package controller;


import domain.CarDAO;
import domain.CustomerDAO;
import domain.OrdersDAO;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/AdminLogin")
public class AdminLoginServlet extends HttpServlet {

    private final String USERNAME = "root";
    private final String PASS = "root";

    @Inject
    private CarDAO carDAO;
    @Inject
    private CustomerDAO customerDAO;
    @Inject
    private OrdersDAO ordersDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.equals(USERNAME) && password.equals(PASS)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("activeUser", username); //attribute used in AdminAuthFilter

            session.setAttribute("carList", carDAO.showCars());
            session.setAttribute("customerList", customerDAO.showCustomers());
            session.setAttribute("ordersList", ordersDAO.showOrders());

            request.getRequestDispatcher("main_admin.jsp").forward(request, response);
        } else {
            response.sendRedirect("log_in_admin.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
