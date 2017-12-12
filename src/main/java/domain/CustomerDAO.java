package domain;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAPersistUnit");

    private static List<Customer> customerList = new ArrayList<>();

    public void addCustomer(Customer customer) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            em.persist(customer);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<Customer> showCustomers() {
        int count = 1;

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            while(em.find(Customer.class, count) != null) {
                customerList.add(em.find(Customer.class, count));
                count++;
            }
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return customerList;
    }
}
