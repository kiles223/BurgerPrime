package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.*;
import org.example.burgerprime.models.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;
@Slf4j
@Controller
@RequiredArgsConstructor
public class OrderController {
    public final OrderRepository orderRepository;
    public final AccountRepository accountRepository;
    public final ProductRepository productRepository;
    private final BasketRepository basketRepository;
    private final AccountInformationRepository accountInformationRepository;
    private final RestTemplate restTemplate;

    @PostMapping("/order")
    public String order(Authentication authentication, @RequestBody Map<String, Object> orderData) {
        String username = authentication.getName();
        Account account = accountRepository.findByName(username);
        AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
        Order new_order = new Order();
        new_order.setStatus("В процессе доставки");
        new_order.setAccount(account);
        new_order.setAddress(accountInformation.getAddress());
        Basket basket = basketRepository.findByAccount(account);
        if (basket != null) {
            basket.clearBasket();
            basketRepository.save(basket);
            log.info("Basket cleared for account ID: " + account.getId());
        }

        if (orderData != null && !orderData.isEmpty()) {
            orderData.forEach((key, value) -> {
                try {
                    int productId = Integer.parseInt(key);
                    int quantity = Integer.parseInt(value.toString());

                    if (quantity > 0) {
                        Product product = productRepository.getProductById(productId);
                        if (product != null) {
                            new_order.addProduct(product, quantity);
                        }
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid format for key: " + key + ", value: " + value);
                }
            });
            System.out.println("Products in order before save: " + new_order.getProducts().size());
            accountInformation.plusToWaste(new_order);
            accountInformationRepository.save(accountInformation);
            try {
                String espResponse = restTemplate.getForObject(
                        "http://192.168.0.148:80/ring",
                        String.class
                );
                System.out.println("ESP32 ответил: " + espResponse);
                orderRepository.save(new_order);
            } catch (Exception e) {
                System.err.println("ESP32 недоступен: " + e.getMessage());
                orderRepository.save(new_order);
                return "redirect:/menu";
            }
        }
        return "redirect:/menu";
    }
    @GetMapping("/orders")
    public String getOrders(Authentication authentication,Model model){
        String username = authentication.getName();
        Account account = accountRepository.findByName(username);
        model.addAttribute("account", account);
        model.addAttribute("orders", orderRepository.findByAccount(account));

        return "orders";
    }
}
