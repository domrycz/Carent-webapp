package controller;

import domain.*;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ObjectInfoServlet", urlPatterns = "ObjectInfo")
public class ObjectInfoServlet extends HttpServlet {

    @Inject
    private CarDAO carDAO;
    @Inject
    private CustomerDAO customerDAO;
    @Inject
    private OrdersDAO ordersDAO;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("carId") != null) {
            int carId = Integer.valueOf(request.getParameter("carId"));
            Car car = carDAO.getCarById(carId);
            request.setAttribute("car", car);

            request.getRequestDispatcher("carInfo_admin.jsp").forward(request, response);

        } else if(request.getParameter("customerId") != null) {
            int customerId = Integer.valueOf(request.getParameter("customerId"));
            Customer customer = customerDAO.getCustomerById(customerId);
            request.setAttribute("customer", customer);

            request.getRequestDispatcher("customerInfo_admin.jsp").forward(request, response);

        } else if(request.getParameter("orderId") != null) {
            long orderId = Long.valueOf(request.getParameter("orderId"));
            Orders order = ordersDAO.getOrderById(orderId);
            request.setAttribute("order", order);

            request.getRequestDispatcher("orderInfo_admin.jsp").forward(request, response);
        }
    }
}
