package controller;

import domain.Car;
import domain.CarDAO;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CarToDbServlet", urlPatterns = "/CarToDb")
public class CarToDbServlet extends HttpServlet {

    @Inject
    private CarDAO carDAO;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("brand") != null) {

            Car car = new Car();
            car.setModel(request.getParameter("model"));
            car.setBrand(request.getParameter("brand"));
            car.setEngine(request.getParameter("engine"));
            car.setAvailable(true); // true is the default value for every new Car
            car.setYearProd(Integer.valueOf(request.getParameter("yearProd")));
            car.setSegment(request.getParameter("segment").charAt(0));

            carDAO.addCar(car);

        }
        response.sendRedirect("main_admin.html");
    }

}
