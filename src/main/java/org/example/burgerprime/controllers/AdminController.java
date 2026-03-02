package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.models.Account;
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
}
