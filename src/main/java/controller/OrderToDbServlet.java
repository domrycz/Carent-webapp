package controller;

import domain.*;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "OrderToDbServlet", urlPatterns = "/OrderToDb")
public class OrderToDbServlet extends HttpServlet {

    @Inject
    private CarDAO carDAO;
    @Inject
    private CustomerDAO customerDAO;
    @Inject
    private OrdersDAO ordersDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("customerId") != null) {

            int customerId = Integer.valueOf(request.getParameter("customerId"));
            int carId = Integer.valueOf(request.getParameter("carId"));
            Customer customer = customerDAO.getCustomerById(customerId);
            Car car = carDAO.getCarById(carId);

            LocalDate startDate = LocalDate.parse(request.getParameter("startDate"), DateFormat.getDateFormat());
            LocalDate endDate = LocalDate.parse(request.getParameter("endDate"), DateFormat.getDateFormat());

            Orders order = new Orders(customer, car, startDate, endDate);
            ordersDAO.addOrder(order);

            request.getSession(false).removeAttribute("ordersList");
            request.getSession(false).setAttribute("ordersList", ordersDAO.showOrders());
        }

        response.sendRedirect("orders_admin.jsp");
    }

}
