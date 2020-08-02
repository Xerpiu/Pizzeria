package pj.pizzeria.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Product
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private BigDecimal price;

    public Product() {

    }

    public Product(String name, BigDecimal price) {
        this.name = name;
        this.price = price;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    @JsonIgnore
    public String getType()
    {
        return "Product";
    }
}
