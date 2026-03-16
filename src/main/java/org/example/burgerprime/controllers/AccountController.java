package org.example.burgerprime.controllers;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountInformationRepository;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.BasketRepository;
import org.example.burgerprime.models.*;
import org.example.burgerprime.services.Service;
import org.example.burgerprime.services.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.function.Consumer;


@AllArgsConstructor
@Controller
@Slf4j
public class AccountController {
    private final UserService userService;
    private final AccountRepository accountRepository;
    private final AccountInformationRepository accountInformationRepository;
    @GetMapping("/profile/datas")
    public String profileData(Authentication authentication, Model model) {
        String name = authentication.getName();
        Account account = accountRepository.findByName(name);
        AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
        if (accountInformation != null) {
            model.addAttribute("accountInformation", accountInformation);
        }
        return "datas";
    }
    @PostMapping("/account/add_data")
    public String addData(Authentication authentication,
                          String displayed_name,
                          String phone_number,
                          String gender,
                          String email,
                          String date_of_birth) {
        String username = authentication.getName();
        Account account = accountRepository.findByName(username);
        AccountInformation existingInfo = accountInformationRepository.findByAccount(account);

        AccountInformation newAccountInfo = new AccountInformation();

        newAccountInfo.setId(existingInfo.getId());
        newAccountInfo.setAccount(account);
        newAccountInfo.setWaste(existingInfo.getWaste());
        newAccountInfo.setDiscount(existingInfo.getDiscount());
        newAccountInfo.setAddress(existingInfo.getAddress());

        userService.updateIfNotEmpty(displayed_name, existingInfo.getDisplayed_name(),
                newAccountInfo::setDisplayed_name);
        userService.updateIfNotEmpty(phone_number, existingInfo.getPhone_number(),
                newAccountInfo::setPhone_number);
        userService.updateIfNotEmpty(gender, existingInfo.getGender(),
                newAccountInfo::setGender);
        userService.updateIfNotEmpty(email, existingInfo.getEmail(),
                newAccountInfo::setEmail);
        userService.updateIfNotEmpty(date_of_birth, existingInfo.getDate_of_birth(),
                newAccountInfo::setDate_of_birth);

        accountInformationRepository.save(newAccountInfo);
        return "redirect:/profile";
    }
    @GetMapping("/delete_account")
    public String deleteAccount(Authentication authentication) {
        Object principal = authentication.getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        Account account = accountRepository.findByName(username);
        accountRepository.delete(account);
        return "redirect:/login";
    }
    @GetMapping("/profile/settings")
    public String settings() {
        return "settings";
    }
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(Account user, Model model) {
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage", "Пользователь уже существует");
            return "registration";
        }
        userService.createUser(user);
        return "redirect:/login";
    }
    @GetMapping("/profile")
    public String profile(Model model, Authentication authentication) {
        Object principal = authentication.getPrincipal();

        String username = null;

        // Для обычных пользователей (form login)
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
            System.out.println("Regular user: " + username);
        }
        // Для OAuth2 пользователей (Google)
        else if (principal instanceof OAuth2User) {
            OAuth2User oauth2User = (OAuth2User) principal;
            username = oauth2User.getAttribute("email"); // или "name", в зависимости от вашей настройки
            System.out.println("OAuth2 user: " + username);
            System.out.println("OAuth2 attributes: " + oauth2User.getAttributes());
        }
        // На всякий случай
        else {
            System.out.println("Unknown principal type: " + principal.getClass());
            username = principal.toString();
        }

        // Находим аккаунт
        Account account = accountRepository.findByName(username);
        System.out.println("Account found: " + (account != null ? account.getId() : "null"));

        AccountInformation accountInformation = null;

        if (account != null) {
            accountInformation = accountInformationRepository.findByAccount(account);
            System.out.println("AccountInformation found: " + (accountInformation != null));
        }

        // Всегда добавляем что-то в модель, даже если null
        model.addAttribute("accountInformation", accountInformation);

        model.addAttribute("account", account);

        return "profile";
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
    @PostMapping("/profile/add_address")
    public String addAddress(Authentication authentication, String address) {
        String username = authentication.getName();
        Account account = accountRepository.findByName(username);
        AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
        accountInformation.setAddress(address);
        accountInformationRepository.save(accountInformation);
        return "redirect:/basket";
    }

//    @PostMapping("/profile/edit_avatar")
//    public String editAvatar(Authentication authentication, @RequestParam("file") MultipartFile file) throws IOException {
//        Image avatar;
//        Object principal = authentication.getPrincipal();
//        String username = ((UserDetails) principal).getUsername();
//        Account account = accountRepository.findByName(username);
//        if (file.getSize() != 0) {
//            avatar = service.toImageEntity(file);
//            account.setAvatar(avatar);
//        }
//        Account accountFromDb = accountRepository.save(account);
//        accountFromDb.setAvatarId(accountFromDb.getAvatar().getId());
//        accountRepository.save(account);
//        return "redirect:/login";
//    }
}
