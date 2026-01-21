package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Product;
import org.example.burgerprime.services.Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final Service service;
    private final ProductRepository productRepository;
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
    @PostMapping("/add/product")
    public String addProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Product product) throws IOException {

        service.saveProduct(product, file1, file2, file3);

        return "redirect:/add/product";
    }
}
