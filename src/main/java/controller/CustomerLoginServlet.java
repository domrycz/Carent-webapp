package controller;

import domain.*;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerLoginServlet", urlPatterns = "CustomerLogin")
public class CustomerLoginServlet extends HttpServlet {

    @Inject
    private CustomerDAO customerDAO;
    @Inject
    private OrdersDAO ordersDAO;
    @Inject
    private CarDAO carDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String customerEmail = request.getParameter("email");
        String customerPass = request.getParameter("password");
        Customer customer = customerDAO.checkCustomerInDb(customerEmail, customerPass);

        if(customer != null) {
            HttpSession session = request.getSession(true);
            String formatId = String.format("%04d", customer.getCustomerId()); //ZEROFILL of customer id
            session.setAttribute("customerId", formatId);
            session.setAttribute("activeUser", customer);

            List<Orders> customersOrders = ordersDAO.showCustomerOrders(customer);
            session.setAttribute("customersOrders", customersOrders);

            List<Car> carList = carDAO.showCars();
            session.setAttribute("carList", carList);

            request.getRequestDispatcher("main_customer.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }

    }

}
