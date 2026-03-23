package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountInformationRepository;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.AccountInformation;
import org.example.burgerprime.models.Basket;
import org.example.burgerprime.models.Product;
import org.example.burgerprime.services.Service;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final Service service;
    private final ProductRepository productRepository;
    private final AccountRepository accountRepository;
    private final AccountInformationRepository accountInformationRepository;

    @GetMapping("/admin/add/product")
    public String addProduct() {
        return "add_product";
    }
    @GetMapping("/menu")
    public String products(Model model, Authentication authentication){
        if (authentication != null) {
            String username = authentication.getName();
            Account account = accountRepository.findByName(username);
            AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
            List<Product> basketProducts = account.getBasket().getProducts();
            List<Integer> basketProductsId = new ArrayList<>();
            for (Product product : basketProducts) {
                basketProductsId.add(product.getId());
            }
            model.addAttribute("discount", accountInformation.getDiscount());
            model.addAttribute("basketProductsId", basketProductsId);
        }else{
            model.addAttribute("discount", 0);
        }
        model.addAttribute("isAuthenticated", authentication != null && authentication.isAuthenticated());
        model.addAttribute("products", productRepository.findAll());
        return "menu";
    }
    @PostMapping("/admin/add/product")
    public String addProduct(@RequestParam("file") MultipartFile file, Product product) throws IOException {

        service.saveProduct(product, file);

        return "redirect:/admin/add/product";
    }
}
