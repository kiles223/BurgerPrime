package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")
@Data
@RequiredArgsConstructor
public class Order {
    @Id
    @GeneratedValue
    private Integer id;
    @ManyToOne
    private Account account;
    @ManyToMany
    @JoinTable(
            name = "order_products",
            joinColumns = @JoinColumn(name = "order_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private List<Product> products = new ArrayList<>();

    public Integer totalPrice(){
        int sum = 0;
        for (Product product : products) {
            sum += product.getPrice();
        }
        return sum;
    }
    public void addProducts(List<Product> products){
        this.products.addAll(products);
    }
}
