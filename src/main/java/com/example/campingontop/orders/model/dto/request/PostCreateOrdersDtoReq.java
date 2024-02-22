package com.example.campingontop.orders.model.dto.request;

import com.example.campingontop.cart.model.dto.response.CreateCartReq;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PostCreateOrdersDtoReq {
    private Long cartId;

    private String impUid;
    private Integer amount;
    private String merchantUid;
    private String paymentStatus;
}
