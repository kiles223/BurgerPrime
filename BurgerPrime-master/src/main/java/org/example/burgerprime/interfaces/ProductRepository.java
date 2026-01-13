package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    Product getProductById(Integer id);

}
