package org.example.burgerprime.controllers;

import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ImageRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Image;
import org.example.burgerprime.models.Order;
import org.example.burgerprime.models.Product;
import org.example.burgerprime.services.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@org.springframework.stereotype.Controller
@Slf4j
@RequiredArgsConstructor
public class Controller {
    public final Service service;
    public final ProductRepository productRepository;
    public final AccountRepository accountRepository;
    @GetMapping("/")
    public String index(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        return "index";
    }
    @GetMapping("/add/product")
    public String addProduct() {
        return "add_product";
    }


    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Integer id, Model model) {
        Product product = productRepository.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product_info";
    }
    @GetMapping("/profile")
    public String profile( Model model, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Account account = accountRepository.findByName(username);
            model.addAttribute("account", account);
            model.addAttribute("orders", account.getOrders());
        }
        return "profile";
    }
    @PostMapping("/profile")
    public String addAvatar( MultipartFile file, Authentication authentication) throws IOException {
        Object principal = authentication.getPrincipal();
        Account account = accountRepository.findByName(((UserDetails) principal).getUsername());
        Image image;
        if (file.getSize() != 0) {
            image = service.toImageEntity(file);
            image.setAvatar(true);
            account.addImageToAccount(image);
        }
        return "profile";
    }
}
