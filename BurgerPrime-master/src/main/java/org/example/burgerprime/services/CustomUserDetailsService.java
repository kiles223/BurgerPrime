package org.example.burgerprime.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.burgerprime.interfaces.AccountRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final AccountRepository accountRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("===== LOADING USER: '{}' =====", username);

        if (username == null || username.isEmpty()) {
            throw new UsernameNotFoundException("Username is empty");
        }

        var account = accountRepository.findByName(username);

        if (account == null) {
            log.error("User not found in database: {}", username);
            throw new UsernameNotFoundException("User not found: " + username);
        }

        log.info("User loaded successfully: {}", username);
        log.info("User active: {}, roles: {}", account.isActive(), account.getRoles());

        return account;
    }
}