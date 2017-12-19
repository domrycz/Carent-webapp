package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class Customer implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "customer_id", nullable = false, columnDefinition = "INT(4) ZEROFILL")
    private Integer customerId;
    @Column(nullable = false, columnDefinition = "VARCHAR(30)")
    private String firstname;
    @Column(nullable = false, columnDefinition = "VARCHAR(40)")
    private String lastname;
    @Column(name = "dr_lic_date", nullable = false, columnDefinition = "DATE")
    private LocalDate driverLicDate;
    @Column(name = "id_number", nullable = false, columnDefinition = "VARCHAR(20)")
    private String idNumber;
    @Column(nullable = false, columnDefinition = "VARCHAR(20)")
    private String password;
    @Column(nullable = false, columnDefinition = "VARCHAR(40) UNIQUE")
    private String email;

    @OneToMany(mappedBy = "customerId")
    private List<Orders> orders;

    public Customer() {}
    public Customer(String firstname, String lastname, LocalDate driverLicDate, String idNumber, String password, String email) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.driverLicDate = driverLicDate;
        this.idNumber = idNumber;
        this.password = password;
        this.email = email;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public LocalDate getDriverLicDate() {
        return driverLicDate;
    }

    public void setDriverLicDate(LocalDate driverLicDate) {
        this.driverLicDate = driverLicDate;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }
}
