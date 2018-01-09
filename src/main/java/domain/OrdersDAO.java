package domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {

    @PersistenceUnit(unitName = "JPAPersistenceUnit")
    private EntityManagerFactory emf;

    private List<Orders> ordersList = new ArrayList<>();
    private List<Orders> customerOrdersList = new ArrayList<>();

    public void addOrder(Orders order) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();
            em.persist(order);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<Orders> showOrders() {

        EntityManager em = emf.createEntityManager();
        TypedQuery<Orders> query = em.createNamedQuery("Orders.findAll", Orders.class);

        try {
            ordersList = query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return ordersList;
    }

    public Orders getOrderById(long id) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();
        Orders order  = null;

        try {
            trans.begin();
            order = em.find(Orders.class, id);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return order;
    }

    public List<Orders> showCustomerOrders(Customer customer) {

        EntityManager em = emf.createEntityManager();
        TypedQuery<Orders> query = em.createNamedQuery("Orders.findCustomersOrders", Orders.class);
        query.setParameter("customer", customer);

        customerOrdersList = query.getResultList();

        return customerOrdersList;
    }

    public void updateOrder(Orders order) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            Orders updOrder = em.find(Orders.class, order.getOrderId());
            trans.begin();
            updOrder.setCustomer(order.getCustomer());
            updOrder.setCar(order.getCar());
            updOrder.setStartDate(order.getStartDate());
            updOrder.setEndDate(order.getEndDate());
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void removeOrder(long id) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction trans = em.getTransaction();
        Orders order  = null;

        try {
            trans.begin();
            order = em.find(Orders.class, id);
            em.remove(order);
            trans.commit();
        } catch (Exception ex) {
            if(trans != null) {trans.rollback();}
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }
}
