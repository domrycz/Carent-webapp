package domain;

import javax.enterprise.context.RequestScoped;
import javax.persistence.*;
import java.util.*;

@RequestScoped
public class CarDAO {

    @PersistenceUnit(name = "JPAPersistenceUnit")
    private EntityManagerFactory emf;

    private List<Car> carList = new ArrayList<>();

    public void addCar(Car car) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            em.persist(car);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<Car> showCars() {
        int count = 1;

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            while(em.find(Car.class, count) != null) {
                carList.add(em.find(Car.class, count));
                count++;
            }
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }

        return carList;
    }

    public Car getCarById(int id) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();
        Car car = null;

        try {
            trans.begin();
            car = em.find(Car.class, id);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return car;
    }

}
