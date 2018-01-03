package controller;

import domain.CarDAO;
import domain.Customer;
import domain.CustomerDAO;
import domain.OrdersDAO;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveFromDbServlet", urlPatterns = "RemoveFromDb")
public class RemoveFromDbServlet extends HttpServlet {

    @Inject
    private CarDAO carDAO;
    @Inject
    private OrdersDAO ordersDAO;
    @Inject
    private CustomerDAO customerDAO;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("carId") != null) {        // REMOVING OBJECTS BY ADMIN
            int carId = Integer.valueOf(request.getParameter("carId"));
            carDAO.removeCar(carId);

            // update of carList attribute after deleting a car
            request.getSession(false).removeAttribute("carList");
            request.getSession(false).setAttribute("carList", carDAO.showCars());

            response.sendRedirect("cars_admin.jsp");

        } else if(request.getParameter("orderId") != null) {
            long orderId = Long.valueOf(request.getParameter("orderId"));
            ordersDAO.removeOrder(orderId);

            // update of ordersList attribute after deleting an order
            request.getSession(false).removeAttribute("ordersList");
            request.getSession(false).setAttribute("ordersList", ordersDAO.showOrders());

            response.sendRedirect("orders_admin.jsp");

        } else if(request.getParameter("customerId") != null) {
            int customerId = Integer.valueOf(request.getParameter("customerId"));
            customerDAO.removeCustomer(customerId);

            // update of customerList attribute after deleting a customer
            request.getSession(false).removeAttribute("customerList");
            request.getSession(false).setAttribute("customerList", customerDAO.showCustomers());

            response.sendRedirect("users_admin.jsp");

        } else if(request.getParameter("userOrderId") != null) {         // REMOVING OBJECTS BY USER
            long orderId = Long.valueOf(request.getParameter("userOrderId"));
            ordersDAO.removeOrder(orderId);

            // update of customersOrders list after deleting an order by customer
            request.getSession(false).removeAttribute("customersOrders");
            Customer customer = (Customer) request.getSession(false).getAttribute("activeUser");
            request.getSession(false).setAttribute("customersOrders", ordersDAO.showCustomerOrders(customer));

            response.sendRedirect("main_customer.jsp");
        }
    }
}
