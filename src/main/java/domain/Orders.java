package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@NamedQueries({
        @NamedQuery(name = "Orders.findCustomersOrders", query = "SELECT o FROM Orders o WHERE o.customer = :customer"),
        @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
})
public class Orders implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="order_id", columnDefinition = "INT(7) ZEROFILL")
    private Long orderId;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;
    @Column(name = "start_date", columnDefinition = "DATE")
    private LocalDate startDate;
    @Column(name = "end_date", columnDefinition = "DATE")
    private LocalDate endDate;

    public Orders() {}
    public Orders(Customer customer, Car car, LocalDate startDate, LocalDate endDate) {
        this.customer = customer;
        this.car = car;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Long getOrderId() {
        return orderId;
    }

    public String getOrderIdZeroFill() {
        return String.format("%07d", this.orderId);
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

}
