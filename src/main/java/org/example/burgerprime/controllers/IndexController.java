package org.example.burgerprime.controllers;

import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Product;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@org.springframework.stereotype.Controller
@Slf4j
@RequiredArgsConstructor
public class IndexController {

    public final ProductRepository productRepository;
    public final AccountRepository accountRepository;
    @GetMapping("/")
    public String index(Authentication authentication, Model model) {
        Object principal = authentication.getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        Account account = accountRepository.findByName(username);
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        model.addAttribute("account", account);
        return "index";
    }

}
