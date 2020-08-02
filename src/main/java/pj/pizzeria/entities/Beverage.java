package pj.pizzeria.entities;

import javax.persistence.Entity;
import java.math.BigDecimal;

@Entity
public class Beverage extends Product
{
    public enum Litres {
        // 0.5l + 1l
        S, M
    }

    private Litres litres;
    private boolean cooled;

    public Beverage() {

    }

    public Beverage(String name, BigDecimal price, Litres litres, boolean cooled) {
        super(name, price);

        setLitres(litres);
        setCooled(cooled);
    }

    public Litres getLitres() {
        return litres;
    }

    public void setLitres(Litres litres) {
        this.litres = litres;
    }

    public boolean isCooled() {
        return cooled;
    }

    public void setCooled(boolean cooled) {
        this.cooled = cooled;
    }

    @Override
    public String getType() {
        return "Beverage";
    }
}
