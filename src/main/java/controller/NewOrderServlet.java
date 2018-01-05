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

@WebServlet(name = "NewOrderServlet", urlPatterns = "NewOrder")
public class NewOrderServlet extends HttpServlet {

    @Inject
    private OrdersDAO ordersDAO;
    @Inject
    private CarDAO carDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LocalDate startDate = LocalDate.parse(request.getParameter("start_date"), DateFormat.getDateFormat());
        LocalDate endDate = LocalDate.parse(request.getParameter("end_date"), DateFormat.getDateFormat());
        int carId = Integer.valueOf(request.getParameter("car"));

        Car car = carDAO.getCarById(carId);
        Customer customer = (Customer) request.getSession(false).getAttribute("activeUser");

        Orders newOrder = new Orders();
        newOrder.setStartDate(startDate);
        newOrder.setEndDate(endDate);
        newOrder.setCar(car);
        newOrder.setCustomer(customer);

        ordersDAO.addOrder(newOrder);

        request.getSession(false).removeAttribute("customersOrders");
        request.getSession(false).setAttribute("customersOrders", ordersDAO.showCustomerOrders(customer));

        response.sendRedirect("main_customer.jsp");
    }
}