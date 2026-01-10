package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.example.burgerprime.models.enums.Role;
import java.util.*;

@Entity
@Table(name = "accounts")
@Data
@RequiredArgsConstructor
public class Account implements UserDetails {
    @Id
    @GeneratedValue
    private Integer id;
    @Column(name = "name",unique = true, length = 100)
    private String name;
    @Column(name = "password", length = 1000)
    private String password;
    private boolean active;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "account_role", joinColumns = @JoinColumn(name = "account_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "author", fetch = FetchType.EAGER)
    List<Order> orders = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "author", fetch = FetchType.EAGER)
    List<Feedback> feedbacks = new ArrayList<>();

    public void addFeedback(Feedback feedback) {
        feedback.setAuthor(this);
        feedbacks.add(feedback);
    }
    public void addOrder(Order order) {
        order.setAuthor(this);
        orders.add(order);
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
