package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.OrderProduct;
import org.example.burgerprime.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderProductRepository extends JpaRepository<OrderProduct, Integer> {
    List<OrderProduct> findAllByProduct(Product product);
}
