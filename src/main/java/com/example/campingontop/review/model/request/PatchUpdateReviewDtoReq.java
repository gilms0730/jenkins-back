package com.example.campingontop.review.model.request;

import com.example.campingontop.orders.model.Orders;
import com.example.campingontop.reviewImage.model.ReviewImage;
import lombok.*;
import org.hibernate.annotations.Comment;

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
public class PatchUpdateReviewDtoReq {
    private String title;
    private String content;
    private int rating;
}
