package pj.pizzeria.controllers;

import pj.pizzeria.services.ProductService;
import pj.pizzeria.entities.Beverage;
import pj.pizzeria.entities.Pizza;
import pj.pizzeria.entities.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/product")
public class ProductController
{
    @Autowired
    private ProductService productService;

    @PostMapping("/addProduct")
    public Product addProduct(@RequestBody Product product)
    {
        return productService.addProduct(product);
    }

    @PostMapping("/addBeverage")
    public Beverage addBeverage(@RequestBody Beverage beverage)
    {
        Beverage b = (Beverage) productService.addProduct(beverage);

        return b;
    }

    @PostMapping("/addPizza")
    public Pizza addPizza(@RequestBody Pizza pizza)
    {
        Pizza p = (Pizza) productService.addProduct(pizza);

        return p;
    }

    @DeleteMapping("/removeProduct")
    public void removeProduct(Integer id)
    {
        productService.removeProductById(id);
    }

    @GetMapping("/getProduct")
    @ResponseBody
    public Optional<Product> getProduct(Integer id)
    {
        Optional<Product> p = productService.getProductById(id);

        return p;
    }

    @GetMapping("/getProducts")
    @ResponseBody
    public Iterable<Product> getProducts()
    {
        return productService.getAllProducts();
    }

    @GetMapping("/getBeverages")
    @ResponseBody
    public Iterable<? extends Product> getBeverages()
    {
        return productService.getAllProductsByType("Beverage");
    }

    @GetMapping("/getPizzas")
    @ResponseBody
    public Iterable<? extends Product> getPizzas()
    {
        return productService.getAllProductsByType("Pizza");
    }
}
