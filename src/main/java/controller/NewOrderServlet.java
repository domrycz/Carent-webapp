package controller;

import domain.CarDAO;
import domain.CustomerDAO;
import domain.DateFormat;
import domain.OrdersDAO;

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
    @Inject
    private CustomerDAO customerDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDate startDate = LocalDate.parse(request.getParameter("start_date"), DateFormat.getDateFormat());

    }

}
