package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Integer> {
    Account findByName(String name);

    void deleteByName(String name);
}
