package com.example.campingontop.review.model.request;

import com.example.campingontop.orders.model.Orders;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
public class PostCreateReviewDtoReq {
    private String title;
    private String content;
    private Integer rating;
    private Long ordersId;

}

