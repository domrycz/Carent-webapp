package domain;

import javax.persistence.*;
import java.util.*;

public class CarDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAPersistUnit");

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

}
