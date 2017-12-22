package controller;

import domain.Customer;
import domain.CustomerDAO;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String customerEmail = request.getParameter("email");
        String customerPass = request.getParameter("password");
        Customer customer = customerDAO.checkCustomerInDb(customerEmail, customerPass);

        if(customer != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("customerName", customer.getFirstname());
            request.getRequestDispatcher("main_customer.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }

    }

}
