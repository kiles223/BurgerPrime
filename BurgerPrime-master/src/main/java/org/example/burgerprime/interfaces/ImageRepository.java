package org.example.burgerprime.interfaces;

import org.example.burgerprime.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Integer> {

}
