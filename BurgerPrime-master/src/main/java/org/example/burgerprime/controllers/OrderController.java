package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.OrderRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Order;
import org.example.burgerprime.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class OrderController {

    public final OrderRepository orderRepository;
    public final AccountRepository accountRepository;
    public final ProductRepository productRepository;
    @PostMapping("/order")
    public String order(Integer burgerID, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Account account = accountRepository.findByName(username);
            Order order = new Order();
            Product product = productRepository.getProductById(burgerID);
            order.setProduct(product);
            account.addOrder(order);
            orderRepository.save(order);
            return "redirect:/";
        }
        return "/product/" + burgerID;
    }
}
