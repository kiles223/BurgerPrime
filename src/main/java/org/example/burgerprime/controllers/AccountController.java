package org.example.burgerprime.controllers;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.net.Authenticator;

@AllArgsConstructor
@Controller
@Slf4j
public class AccountController {

    private final UserService userService;
    private final AccountRepository accountRepository;
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "reg";
    }


    @PostMapping("/registration")
    public String createUser(Account user, Model model) {
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage", "Пользователь уже существует");
            return "reg";
        }
        userService.createUser(user);
        return "redirect:/login";
    }
    @PostMapping("/profile/edit_name")
    public String editName(Authentication authentication, String new_name) {
        Object principal = authentication.getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        Account account = accountRepository.findByName(username);
        account.setName(new_name);
        accountRepository.save(account);
        log.info("User {} changed name to {}", username, new_name);
        return "redirect:/login";
    }
}
