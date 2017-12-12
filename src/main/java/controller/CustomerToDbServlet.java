package controller;


import domain.Customer;
import domain.CustomerDAO;
import domain.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "CustomerToDbServlet", urlPatterns = "/CustomerToDb")
public class CustomerToDbServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("firstname") != null) {
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = new Customer();

            customer.setFirstname(request.getParameter("firstname"));
            customer.setLastname(request.getParameter("lastname"));
            LocalDate driverLicDate = LocalDate.parse(request.getParameter("driverLicDate"), DateFormat.getDateFormat());
            customer.setDriverLicDate(driverLicDate);
            customer.setIdNumber(request.getParameter("idNumber"));
            customer.setEmail(request.getParameter("email"));
            customer.setPassword(request.getParameter("password"));

            customerDAO.addCustomer(customer);
        }
        // TODO Make a web pages with confirmation and error
        response.sendRedirect("main_admin.html");
    }
}