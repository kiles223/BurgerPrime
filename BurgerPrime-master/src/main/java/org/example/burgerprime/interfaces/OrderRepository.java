package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Integer> {
}
