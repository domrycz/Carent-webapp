package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Entity
public class Orders implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="order_id", columnDefinition = "INT(7) ZEROFILL")
    private Long orderId;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customerId;
    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car carId;
    @Column(name = "start_date", columnDefinition = "DATE")
    private LocalDate startDate;
    @Column(name = "end_date", columnDefinition = "DATE")
    private LocalDate endDate;

    public Orders() {}
    public Orders(Customer customer, Car car, LocalDate startDate, LocalDate endDate) {
        this.customerId = customer;
        this.carId = car;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Car getCarId() {
        return carId;
    }

    public void setCarId(Car carId) {
        this.carId = carId;
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
