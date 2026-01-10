package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.FeedbackRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Feedback;
import org.example.burgerprime.models.Product;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FeedbackController {
    public final AccountRepository accountRepository;
    public final ProductRepository productRepository;
    public final FeedbackRepository feedbackRepository;
    @PostMapping("/feedback")
    public String createFeedback(Integer burgerID, Authentication authentication, String feedback, Integer rating) {
        Object principal = authentication.getPrincipal();
        log.info("Текст отзыва:" + feedback);
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Account account = accountRepository.findByName(username);
            Product product = productRepository.getProductById(burgerID);
            if(!feedbackRepository.existsByAuthorIdAndProductId(account.getId(), product.getId())){
                Feedback newFeedback = new Feedback();
                newFeedback.setText(feedback);
                newFeedback.setRating(rating);
                account.addFeedback(newFeedback);
                product.addFeedbackToProduct(newFeedback);
                feedbackRepository.save(newFeedback);
            }
        }
        return "redirect:/";
    }
}
