package org.example.burgerprime.controllers;

import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.example.burgerprime.models.Product;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@org.springframework.stereotype.Controller
@Slf4j
@RequiredArgsConstructor
public class IndexController {

    public final ProductRepository productRepository;
    @GetMapping("/")
    public String index(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        return "index";
    }

}
