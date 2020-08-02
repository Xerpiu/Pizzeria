package pj.pizzeria.entities;

import javax.persistence.Entity;
import java.math.BigDecimal;

@Entity
public class Pizza extends Product
{
    public enum PizzaSize
    {
        // Small
        S,
        // Medium
        M,
        // Large
        L,
        // Extra Large
        XL
    }

    private PizzaSize pizzaSize;

    public Pizza()
    {

    }

    public Pizza(String name, BigDecimal price, PizzaSize pizzaSize) {
        super(name, price);
        setPizzaSize(pizzaSize);
    }

    public PizzaSize getPizzaSize() {
        return pizzaSize;
    }

    public void setPizzaSize(PizzaSize pizzaSize) {
        this.pizzaSize = pizzaSize;
    }

    @Override
    public String getType() {
        return "Pizza";
    }
}
