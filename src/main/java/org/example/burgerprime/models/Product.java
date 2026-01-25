package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
@Data
@RequiredArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
    private Double price;
    @Column (columnDefinition = "text")
    private String description;
    private String category;
    private Integer weight;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER)
    private List<Image> images = new ArrayList<>();
    private Integer previewImageId;
    private LocalDateTime createdAt;


    @PrePersist
    private void init(){
        createdAt = LocalDateTime.now();
    }


    public void addImageToProduct(Image image){
        image.setProduct(this);
        images.add(image);
    }
}
