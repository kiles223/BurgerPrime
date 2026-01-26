package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;
import org.example.burgerprime.models.enums.Role;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Entity
@Table(name = "accounts")
public class Account implements UserDetails {
    @Id
    @GeneratedValue
    private Integer id;
    @Column(name = "name", unique = true, length = 100)
    private String name;
    @Column(name = "password", length = 1000)
    private String password;
    private boolean active;
    private Integer avatarId;
    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
    private Image avatar;
    @OneToOne(mappedBy = "account",cascade = CascadeType.ALL)
    private Basket basket;
    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<Order> orders;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "account_role", joinColumns = @JoinColumn(name = "account_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();


    public Account() {
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


    protected boolean canEqual(final Object other) {
        return other instanceof Account;
    }

}
