package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Feedback;
import org.example.burgerprime.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {
    boolean existsByAuthorIdAndProductId(Integer accountId, Integer productId);
}
