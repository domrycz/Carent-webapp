package domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Car implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "car_id", nullable = false, columnDefinition = "INT(3) ZEROFILL")
    private Integer carId;
    @Column(nullable = false, columnDefinition = "VARCHAR(20)")
    private String brand;
    @Column(nullable = false, columnDefinition = "VARCHAR(20)")
    private String model;
    @Column(name = "year_prod", nullable = false, columnDefinition = "INT(4)")
    private Integer yearProd;
    @Column(name = "is_available", nullable = false, columnDefinition = "TINYINT(1) DEFAULT true")
    private Boolean isAvailable;
    @Column(nullable = false, columnDefinition = "VARCHAR(20)")
    private String engine;
    @Column(nullable = false, columnDefinition = "CHAR(1)")
    private Character segment;

    public Car() {}
    public Car(String brand, String model, Integer yearProd, Boolean isAvailable, String engine, Character segment) {
        this.brand = brand;
        this.model = model;
        this.yearProd = yearProd;
        this.isAvailable = isAvailable;
        this.engine = engine;
        this.segment = Character.toUpperCase(segment);
    }

    public Integer getCarId() {
        return carId;
    }

    public String getCarIdZeroFill() {
        return String.format("%03d", this.carId);
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Integer getYearProd() {
        return yearProd;
    }

    public void setYearProd(Integer yearProd) {
        this.yearProd = yearProd;
    }

    public Boolean getAvailable() {
        return isAvailable;
    }

    public void setAvailable(Boolean available) {
        isAvailable = available;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public Character getSegment() {
        return segment;
    }

    public void setSegment(Character segment) {
        this.segment = segment;
    }


}
