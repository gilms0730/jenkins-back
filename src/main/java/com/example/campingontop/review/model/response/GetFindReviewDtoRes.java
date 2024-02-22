package com.example.campingontop.review.model.response;

import com.example.campingontop.orders.model.Orders;
import com.example.campingontop.review.model.Review;
import com.example.campingontop.reviewImage.model.ReviewImage;
import lombok.*;
import org.apache.kafka.common.protocol.types.Field;
import org.hibernate.annotations.Comment;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetFindReviewDtoRes {
    private Long id;
    private String title;
    private String content;
    private int rating;
    private String houseName;
    private Date createdAt;
    private Date updatedAt;
    private List<String> imageUrls;

    public static GetFindReviewDtoRes toDto(Review review, List<String> filenames){
        return GetFindReviewDtoRes.builder()
                .id(review.getId())
                .title(review.getTitle())
                .content(review.getContent())
                .rating(review.getRating())
                .houseName(review.getOrders().getCart().getHouse().getName())
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .imageUrls(filenames)
                .build();
    }
}
