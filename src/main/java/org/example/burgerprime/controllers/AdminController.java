package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.BasketRepository;
import org.example.burgerprime.interfaces.OrderRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Order;
import org.example.burgerprime.models.Product;
import org.example.burgerprime.models.enums.Role;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {
    private final AccountRepository accountRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    @GetMapping("/admin/users")
    public String users(Model model) {
        List<Account> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);
        return "users";
    }
    @GetMapping("/admin/add_admin/{id}")
    public String addAdmin(@PathVariable Integer id) {
        Account account = accountRepository.findAccountById(id);
        account.getRole().remove(Role.USER);
        account.getRole().add(Role.ADMIN);
        accountRepository.save(account);
        return "redirect:/admin/users";
    }
    @GetMapping("/admin/delete_account/{id}")
    public String deleteAccount(@PathVariable Integer id) {
        accountRepository.deleteById(id);
        return "redirect:/admin/users";
    }
    @GetMapping("/admin/all_orders")
    public String allOrders(Model model) {
        model.addAttribute("orders", orderRepository.findAll());
        return "all_orders";
    }
    @GetMapping("/admin/delivered/{id}")
    public String delevered(@PathVariable Integer id) {
        Order order = orderRepository.findOrderById(id);
        order.setStatus("Выполнен");
        orderRepository.save(order);
        return "redirect:/admin/all_orders";
    }
    @GetMapping("/admin/cancel/{id}")
    public String canceled(@PathVariable Integer id) {
        Order order = orderRepository.findOrderById(id);
        order.setStatus("Отменен");
        orderRepository.save(order);
        return "redirect:/admin/all_orders";
    }
    @GetMapping("/admin/products")
    public String products(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "all_products";
    }
    @GetMapping("/admin/delete_product/{id}")
    public String deleteProduct(@PathVariable Integer id) {
        productRepository.deleteById(id);
        return "redirect:/admin/products";
    }
}
