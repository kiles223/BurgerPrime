package org.example.burgerprime.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.enums.Role;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.function.Consumer;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final AccountRepository accountRepository;
    public boolean createUser(Account account) {
        if(accountRepository.findByName(account.getName()) != null){
            return false;
        }
        account.setActive(true);
        account.getRole().add(Role.USER);

        log.info("User created:" + account.getName());
        accountRepository.save(account);
        return true;
    }
    public boolean deleteUser(String name){
        if(accountRepository.findByName(name) != null){
            accountRepository.deleteByName(name);
            return true;
        }else{
            return false;
        }
    }
    public void updateIfNotEmpty(String newValue, String oldValue, Consumer<String> setter) {
        if (newValue != null && !newValue.trim().isEmpty()) {
            setter.accept(newValue.trim());
        } else {
            setter.accept(oldValue);
        }
    }
}
