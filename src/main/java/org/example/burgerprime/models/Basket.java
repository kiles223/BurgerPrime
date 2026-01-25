package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "baskets")
@Data
@RequiredArgsConstructor
public class Basket {
    @Id
    @GeneratedValue
    private Integer id;
    @OneToOne
    @JoinColumn(name = "account_id")
    private Account account;
    @ManyToMany
    @JoinTable(
            name = "basket_products",
            joinColumns = @JoinColumn(name = "basket_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private List<Product> products = new ArrayList<>();
    public void addProductToBasket(Product product){
        this.products.add(product);
    }
    public void removeProduct(Product product) {
        this.products.remove(product);
    }
}
