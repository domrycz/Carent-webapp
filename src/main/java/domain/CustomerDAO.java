package domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    @PersistenceUnit(unitName = "JPAPersistenceUnit")
    private EntityManagerFactory emf;

    private static List<Customer> customerList = new ArrayList<>();

    public boolean addCustomer(Customer customer) {
        boolean result = true;
        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            em.persist(customer);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
            result = false;
        } finally {
            em.close();
        }
        return result;
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

    public Customer getCustomerById(int id) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();
        Customer customer = null;

        try {
            trans.begin();
            customer = em.find(Customer.class, id);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return customer;
    }

    public Customer checkCustomerInDb(String email, String password) {
        Customer customer;

        EntityManager em = emf.createEntityManager();
        TypedQuery<Customer> query = em.createNamedQuery("Customer.findParticular", Customer.class);
        query.setParameter("email", email);
        query.setParameter("password", password);

        try {
            customer = query.getSingleResult();
        } catch (NoResultException | NonUniqueResultException nre) {
            return null;
        }

        return customer;
    }
}
