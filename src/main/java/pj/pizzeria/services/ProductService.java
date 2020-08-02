package pj.pizzeria.services;

import pj.pizzeria.entities.Product;
import pj.pizzeria.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

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

    public Iterable<Product> getAllProductsByType(String type)
    {
        return StreamSupport
                .stream(getAllProducts().spliterator(), false)
                .filter(product -> product.getType().equals(type))
                .collect(Collectors.toList());
    }

    public boolean hasProductWithId(Integer id)
    {
        return productRepository.existsById(id);
    }

}
