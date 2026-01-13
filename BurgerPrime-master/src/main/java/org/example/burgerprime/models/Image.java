package org.example.burgerprime.models;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "images")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
    private String originalFileName;
    private Long size;
    private String type;
    private boolean isPreview;
    private boolean isAvatar;
    @Lob
    private byte[] data;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Product product;

    @OneToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Account account;

    public Image() {
    }

    public boolean isPreview() {
        return this.isPreview;
    }

    public void setPreview(boolean isPreview) {
        this.isPreview = isPreview;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Image;
    }

}
