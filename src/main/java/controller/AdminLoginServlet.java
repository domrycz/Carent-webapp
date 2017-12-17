package controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/AdminLogin")
public class AdminLoginServlet extends HttpServlet {

    private final String USERNAME = "root";
    private final String PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.equals(USERNAME) && password.equals(PASS)) {
            request.getRequestDispatcher("main_admin.html").forward(request, response);
        } else {
            response.sendRedirect("log_in_admin.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
