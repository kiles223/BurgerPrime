package org.example.burgerprime.controllers;

import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountInformationRepository;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.AccountInformation;
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

    public final AccountRepository accountRepository;
    public final AccountInformationRepository accountInformationRepository;
    @GetMapping("/")
    public String index( Model model, Authentication authentication) {
        model.addAttribute("isAuthenticated", authentication != null && authentication.isAuthenticated());
        if(authentication != null && authentication.isAuthenticated()) {
            String name = authentication.getName();
            Account account = accountRepository.findByName(name);
            AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
            model.addAttribute("accountInformation", accountInformation);
        }
        return "main";
    }

}
