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
import java.time.LocalDate;

@WebServlet(name = "CustomerToDbServlet", urlPatterns = "/CustomerToDb")
public class CustomerToDbServlet extends HttpServlet {

    @Inject
    private CustomerDAO customerDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("firstname") != null) {

            Customer customer = new Customer();

            customer.setFirstname(request.getParameter("firstname"));
            customer.setLastname(request.getParameter("lastname"));
            LocalDate driverLicDate = LocalDate.parse(request.getParameter("driverLicDate"), DateFormat.getDateFormat());
            customer.setDriverLicDate(driverLicDate);
            customer.setIdNumber(request.getParameter("idNumber"));
            customer.setEmail(request.getParameter("email"));
            customer.setPassword(request.getParameter("password"));

            customerDAO.addCustomer(customer);
            // update of customerList attribute after adding a new customer
            request.getSession(false).removeAttribute("customerList");
            request.getSession(false).setAttribute("customerList", customerDAO.showCustomers());
        }
        response.sendRedirect("main_admin.jsp");
    }
}