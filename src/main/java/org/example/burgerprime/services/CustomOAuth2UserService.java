package org.example.burgerprime.services;

import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.enums.Role;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final AccountRepository accountRepository;

    public CustomOAuth2UserService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = super.loadUser(userRequest);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        Map<String, Object> attributes = oauth2User.getAttributes();

        String email = oauth2User.getAttribute("email");

        Account existingUser = accountRepository.findByName(email);

        if (existingUser == null) {
            Account newAccount = new Account();
            newAccount.setName(email);
            newAccount.setActive(true);

            Set<Role> roles = newAccount.getRole();
            roles.add(Role.USER);
            newAccount.setRole(roles);

            accountRepository.save(newAccount);
            System.out.println("Создан новый пользователь: " + email);

            return new DefaultOAuth2User(
                    Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER")),
                    attributes,
                    extractNameAttributeKey(registrationId)
            );
        } else {
            System.out.println("Найден существующий пользователь: " + existingUser.getName());

            Set<Role> userRoles = existingUser.getRole();
            String roleString = userRoles.stream()
                    .findFirst()
                    .map(Enum::name)
                    .orElse("USER");

            return new DefaultOAuth2User(
                    Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + roleString)),
                    attributes,
                    extractNameAttributeKey(registrationId)
            );
        }
    }

    private String extractNameAttributeKey(String registrationId) {
        return "email";
    }
}