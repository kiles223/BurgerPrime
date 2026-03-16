package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Order;
import org.jspecify.annotations.Nullable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findByAccount(Account account);

    Order findOrderById(Integer id);
}
