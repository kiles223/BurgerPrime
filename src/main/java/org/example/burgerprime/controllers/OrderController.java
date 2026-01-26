package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.OrderRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Order;
import org.example.burgerprime.models.Product;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {
    public final OrderRepository orderRepository;
    public final AccountRepository accountRepository;
    @PostMapping("/order")
    public String order(Authentication authentication) {
        String username = authentication.getName();
        Account account = accountRepository.findByName(username);
        List<Product> products = account.getBasket().getProducts();
        Order order = new Order();
        order.setAccount(account);
        order.addProducts(products);
        account.getBasket().clearBasket();
        orderRepository.save(order);
        return "redirect:/profile";
    }
    @GetMapping("/orders")
    public String getOrders(Authentication authentication,Model model){
        Object principal = authentication.getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        Account account = accountRepository.findByName(username);
        model.addAttribute("account", account);
        model.addAttribute("orders", orderRepository.findAll());

        return "orders";
    }
}
