package org.example.burgerprime.services;

import lombok.AllArgsConstructor;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.Image;
import org.example.burgerprime.models.Product;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
@AllArgsConstructor
@org.springframework.stereotype.Service
public class Service {
    public final ProductRepository productRepository;

    @Transactional
    public void saveProduct(Product product, MultipartFile file) throws IOException {
        Image image;
        if (file.getSize() != 0) {
            image = toImageEntity(file);
            image.setPreview(true);
            product.addImageToProduct(image);
        }
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        productRepository.save(product);
    }
    @Transactional
    public Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setType(file.getContentType());
        image.setSize(file.getSize());
        image.setData(file.getBytes());
        return image;
    }
}
