package pj.pizzeria.services;

import pj.pizzeria.entities.Product;
import pj.pizzeria.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class ProductService
{
    @Autowired
    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product addProduct(Product p)
    {
        return productRepository.save(p);
    }

    public void removeProductById(Integer id)
    {
        productRepository.deleteById(id);
    }

    public Optional<Product> getProductById(Integer id)
    {
        return productRepository.findById(id);
    }

    public Iterable<Product> getAllProducts()
    {
        return productRepository.findAll();
    }

    public Iterable<Product> getAllProductsType(String type)
    {
        ArrayList<Product> productsKind = new ArrayList<Product>();

        for (Product p : getAllProducts())
        {
            if(p.getType().equals(type))
            {
                productsKind.add(p);
            }
        }

        return productsKind;
    }

    public boolean hasProductWithId(Integer id)
    {
        return productRepository.existsById(id);
    }

}
