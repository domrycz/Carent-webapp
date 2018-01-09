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

@WebServlet(name = "EditOrderServlet", urlPatterns = "EditOrder")
public class EditOrderServlet extends HttpServlet {

    @Inject
    private OrdersDAO ordersDAO;
    @Inject
    private CarDAO carDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Customer customer = (Customer) request.getSession(false).getAttribute("activeUser");
        long orderId = Long.valueOf(request.getParameter("orderId"));
        Orders orderAfterUpdate = new Orders();

        int carId = Integer.valueOf(request.getParameter("carId"));
        Car newCar = carDAO.getCarById(carId);
        LocalDate newStartDate = LocalDate.parse(request.getParameter("start_date"), DateFormat.getDateFormat()).plusDays(1L);
        LocalDate newEndDate = LocalDate.parse(request.getParameter("end_date"), DateFormat.getDateFormat()).plusDays(1L);

        orderAfterUpdate.setOrderId(orderId);
        orderAfterUpdate.setCustomer(customer);
        orderAfterUpdate.setCar(newCar);
        orderAfterUpdate.setStartDate(newStartDate);
        orderAfterUpdate.setEndDate(newEndDate);

        ordersDAO.updateOrder(orderAfterUpdate);

        request.getSession(false).removeAttribute("customersOrders");
        request.getSession(false).setAttribute("customersOrders", ordersDAO.showCustomerOrders(customer));

        response.sendRedirect("main_customer.jsp");
    }
}