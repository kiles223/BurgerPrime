package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.BasketRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Basket;
import org.example.burgerprime.models.Product;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class BasketController {
    public final BasketRepository basketRepository;
    public final AccountRepository accountRepository;
    public final ProductRepository productRepository;
    @PostMapping("basket/add_product")
    public String addToBasket(@RequestParam Integer productId,
                              Authentication authentication,
                              RedirectAttributes redirectAttributes) {

        // Получаем текущего пользователя
        String username = authentication.getName();
        Account account = accountRepository.findByName(username);

        // Находим или создаем корзину
        Basket basket = basketRepository.findByAccount(account);
        if (basket == null) {
            basket = new Basket();
            basket.setAccount(account);
        }

        // Находим товар
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        // Добавляем товар в корзину
        basket.addProductToBasket(product);
        basketRepository.save(basket);

        redirectAttributes.addFlashAttribute("message", "Товар добавлен в корзину");
        return "redirect:/product/" + productId; // или куда нужно
    }

    // Удаление товара из корзины
    @PostMapping("basket/remove_product")
    public String removeFromBasket(@RequestParam Integer productId,
                                   Authentication authentication) {

        String username = authentication.getName();
        Account account = accountRepository.findByName(username);
        Basket basket = basketRepository.findByAccount(account);

        if (basket != null) {
            Product product = productRepository.findById(productId)
                    .orElseThrow(() -> new RuntimeException("Product not found"));

            basket.removeProduct(product);
            basketRepository.save(basket);
        }

        return "redirect:/basket";
    }
}
