package controller;

import domain.Customer;
import domain.CustomerDAO;
import domain.DateFormat;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(name = "NewCustomerServlet", urlPatterns = "/NewCustomer")
public class NewCustomerServlet extends HttpServlet {

    @Inject
    private CustomerDAO customerDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean result = true;

        if (request.getParameter("firstname") != null) {

            Customer customer = new Customer();

            customer.setFirstname(request.getParameter("firstname"));
            customer.setLastname(request.getParameter("lastname"));
            String date = request.getParameter("driverLicDate");
            LocalDate driverLicDate = LocalDate.parse(date, DateFormat.getDateFormat());
            customer.setDriverLicDate(driverLicDate);
            customer.setIdNumber(request.getParameter("idNumber"));
            customer.setEmail(request.getParameter("email"));
            customer.setPassword(request.getParameter("password"));

            result = customerDAO.addCustomer(customer);
        }
        if(result) {
            response.sendRedirect("log_in_user.html");
        } else {
            response.sendRedirect("default_error.html");
        }
    }
}
