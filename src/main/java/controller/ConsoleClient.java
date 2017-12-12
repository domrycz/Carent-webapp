package controller;

import domain.Car;
import domain.CarDAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.List;

public class ConsoleClient {
    public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAPersistUnit");
        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();
        /*
        LocalDate date = LocalDate.parse("2014-09-02", DateFormat.getDateFormat());
        LocalDate date1 = LocalDate.parse("2017-10-19", DateFormat.getDateFormat());
        LocalDate date2 = LocalDate.parse("2017-10-21", DateFormat.getDateFormat());

        Customer customer = new Customer("Jan", "Nowak", date, "ABC203040", "oczko", "Janna@anna.pl");
        Customer customer1 = new Customer("Hanna", "Bokowak", date, "ABC12499", "typo", "ana@awp.pl");
        Car car = new Car("Toyota", "Aygo", 2015, true, "1.0 PB", 'B');
        Car car1 = new Car("Ford", "Focus", 2014, true, "2.0 PB", 'D');
        */
        try {
            trans.begin();
            Car car = new Car("Toyota", "Aygo", 2015, true, "1.0 PB", 'B');
            em.persist(car);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }
}
