package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "accounts_info")
@Data

public class AccountInformation {
    @Id
    @GeneratedValue
    private Integer id;
    private String displayed_name;
    private String address;
    private String phone_number;
    private String email;
    private String gender;
    private String date_of_birth;
    private Integer waste;
    private Integer discount;
    @OneToOne
    @JoinColumn(name = "avatar_id")
    private Image avatar;
    @OneToOne
    @JoinColumn(name = "account_id")
    private Account account;
    @PreUpdate
    public void updateDiscount() {
        this.discount = (waste != null ? waste / 1000 : 0);
        if (discount > 20) {
            discount = 20;
        }
    }
    public void plusToWaste(Order order){
        this.waste += order.totalPrice();
    }
}
