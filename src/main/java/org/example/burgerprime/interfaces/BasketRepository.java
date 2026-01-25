package org.example.burgerprime.interfaces;


import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Basket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BasketRepository extends JpaRepository<Basket, Integer> {

    boolean existsByAccount(Account account);

    Basket findByAccount(Account account);
}
