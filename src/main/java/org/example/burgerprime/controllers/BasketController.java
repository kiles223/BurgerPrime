package org.example.burgerprime.controllers;

import lombok.RequiredArgsConstructor;
import org.example.burgerprime.interfaces.AccountInformationRepository;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.BasketRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.AccountInformation;
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

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class BasketController {
    public final BasketRepository basketRepository;
    public final AccountRepository accountRepository;
    public final ProductRepository productRepository;
    private final AccountInformationRepository accountInformationRepository;
    @GetMapping("basket")
    public String basket(Authentication authentication, Model model) {
        int sum = 0;
        if (authentication != null) {
            String username = authentication.getName();
            Account account = accountRepository.findByName(username);
            Basket basket = basketRepository.findByAccount(account);
            AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
            if (basket == null) {
                basket = new Basket();
                basket.setAccount(account);
            }
            for (Product product : basket.getProducts()) {
                sum += product.getPrice();
            }
            model.addAttribute("discount", accountInformation.getDiscount());
            model.addAttribute("accountInformation", accountInformation);
            model.addAttribute("products", basket.getProducts());
            model.addAttribute("sum", sum);
            return "basket";
        }else{
            model.addAttribute("discount", 0);
        }
        return "login";
    }
    @PostMapping("basket/add_product")
    public String addToBasket(@RequestParam Integer productId,
                              Authentication authentication,
                              RedirectAttributes redirectAttributes) {


        String username = authentication.getName();
        Account account = accountRepository.findByName(username);


        Basket basket = basketRepository.findByAccount(account);
        if (basket == null) {
            basket = new Basket();
            basket.setAccount(account);
        }


        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        List<Product> productsInBasket = basket.getProducts();
        if (!productsInBasket.contains(product)) {
            basket.addProductToBasket(product);
            basketRepository.save(basket);
        }


        redirectAttributes.addFlashAttribute("message", "Товар добавлен в корзину");
        return "redirect:/product/" + productId;
    }


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
    @PostMapping("basket/clear")
    public void clearBasket(Authentication authentication) {
        if (authentication != null) {
            String username = authentication.getName();
            Account account = accountRepository.findByName(username);
            Basket basket = basketRepository.findByAccount(account);
            if (basket != null) {
                basket.clearBasket();
            }
        }
    }
}
