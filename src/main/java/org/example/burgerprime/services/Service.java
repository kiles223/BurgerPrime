package org.example.burgerprime.services;

import lombok.AllArgsConstructor;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.example.burgerprime.interfaces.AccountInformationRepository;
import org.example.burgerprime.interfaces.AccountRepository;
import org.example.burgerprime.interfaces.ImageRepository;
import org.example.burgerprime.interfaces.ProductRepository;
import org.example.burgerprime.models.Account;
import org.example.burgerprime.models.AccountInformation;
import org.example.burgerprime.models.Image;
import org.example.burgerprime.models.Product;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
@AllArgsConstructor
@org.springframework.stereotype.Service
public class Service {
    public final ProductRepository productRepository;
    private final AccountRepository accountRepository;
    private final AccountInformationRepository accountInformationRepository;
    private final ImageRepository imageRepository;

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
    public void saveAvatar(Account account, MultipartFile file) throws IOException {
        AccountInformation accountInformation = accountInformationRepository.findByAccount(account);
        if(accountInformation.getAvatar() != null) {
            imageRepository.deleteImageById(accountInformation.getAvatar().getId());
        }
        if (file.getSize() != 0) {
            Image avatar = toImageEntity(file);
            accountInformation.setAvatar(avatar);
        }

        AccountInformation accountInformationFromDb = accountInformationRepository.save(accountInformation);
        accountInformationFromDb.setAva_id(accountInformationFromDb.getAvatar().getId());
        accountInformationRepository.save(accountInformation);
    }

    public Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getOriginalFilename());  // исправлено!
        image.setOriginalFileName(file.getOriginalFilename());
        image.setType(file.getContentType());
        image.setSize(file.getSize());
        image.setData(file.getBytes());
        return image;
    }
}
