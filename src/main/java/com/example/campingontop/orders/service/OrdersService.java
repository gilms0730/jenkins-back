package com.example.campingontop.orders.service;

import com.example.campingontop.cart.model.Cart;
import com.example.campingontop.cart.model.dto.response.CreateCartReq;
import com.example.campingontop.cart.repository.CartRepository;
import com.example.campingontop.house.model.House;
import com.example.campingontop.house.model.response.GetFindHouseDtoRes;
import com.example.campingontop.orderedHouse.model.OrderedHouse;
import com.example.campingontop.orderedHouse.repository.OrderedHouseRepository;
import com.example.campingontop.orders.model.Orders;
import com.example.campingontop.orders.model.dto.request.PostCreateOrdersDtoReq;
import com.example.campingontop.orders.model.dto.response.PostCreateOrdersDtoRes;
import com.example.campingontop.orders.repository.OrdersRepository;
import com.example.campingontop.user.model.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.*;

@Service
@RequiredArgsConstructor
public class OrdersService {
    private final IamportClient iamportClient;
    private final OrdersRepository ordersRepository;
    private final CartRepository cartRepository;
    private final OrderedHouseRepository orderedHouseRepository;

    @Transactional
    public Boolean paymentValidation(PostCreateOrdersDtoReq req) throws IamportResponseException, IOException {
        IamportResponse<Payment> response = getPaymentInfo(req.getImpUid());
        Integer amount = response.getResponse().getAmount().intValue();

        Optional<Orders> result = ordersRepository.findById(req.getCartId());
        if (result.isPresent()) {
            Orders orders = result.get();
            Integer totalPrice = orders.getCart().getPrice();

            if (amount.equals(totalPrice)) {
                createOrders(req);
                return true;
            }
        }
        return false;
    }


    // 정보 가져오는 메소드로 사용하고 검증하는 메소드를 따로 만들자.
    public IamportResponse getPaymentInfo(String impUid) throws IamportResponseException, IOException {
        IamportResponse<Payment> response = iamportClient.paymentByImpUid(impUid);

        return response;
    }

    @Transactional
    public PostCreateOrdersDtoRes createOrders(PostCreateOrdersDtoReq req) throws IamportResponseException, IOException {
        // Fetching cart information
        Cart cart = cartRepository.findById(req.getCartId())
                .orElseThrow(() -> new RuntimeException("Cart not found"));

        Orders orders = Orders.builder()
                .cart(cart)
                .impUid(req.getImpUid())
                .price(req.getAmount())
                .merchantUid(req.getMerchantUid())
                .paymentStatus(req.getPaymentStatus())
                .build();
        orders = ordersRepository.save(orders);

        // Assuming that house information is retrieved from the Cart
        House house = cart.getHouse();

        OrderedHouse orderedHouse = OrderedHouse.builder()
                .orders(orders)
                .house(house)
                .build();

        orders.getOrderedHouseList().add(orderedHouse);

        orderedHouseRepository.save(orderedHouse);

        PostCreateOrdersDtoRes dto = PostCreateOrdersDtoRes.builder()
                .id(orders.getId())
                .name(orders.getCart().getUser().getName())  // Set default or appropriate values
                .email(orders.getCart().getUser().getName())  // Set default or appropriate values
                .checkIn(cart.getCheckIn())
                .checkOut(cart.getCheckOut())
                .price(cart.getPrice())
                .paymentStatus(orders.getPaymentStatus())
                .merchantUid(orders.getMerchantUid())
                .price(orders.getPrice())
                .houseDto(GetFindHouseDtoRes.toDto(house))  // Convert house to GetFindHouseDtoRes
                .build();

        return dto;
    }



    public List<PostCreateOrdersDtoRes> findOrdersList(User user) throws IamportResponseException, IOException {
        List<Orders> result = ordersRepository.findAllByCart_User(user);
        List<PostCreateOrdersDtoRes> dtoList = new ArrayList<>();

        if (!result.isEmpty()) {
            for (Orders orders : result) {
                IamportResponse<Payment> response = getPaymentInfo(orders.getImpUid());
                String customData = response.getResponse().getCustomData();

                Gson gson = new Gson();
                GetFindHouseDtoRes houseDto = gson.fromJson(customData, GetFindHouseDtoRes.class);

                House house = House.builder()
                        .id(houseDto.getId())
                        .name(houseDto.getName())
                        .price(houseDto.getPrice())
                        .address(houseDto.getAddress())
                        .content(houseDto.getContent())
                        .build();

                OrderedHouse orderedHouse = OrderedHouse.builder()
                        .orders(orders)
                        .house(house)
                        .build();

                orderedHouseRepository.save(orderedHouse);

                PostCreateOrdersDtoRes res = PostCreateOrdersDtoRes.builder()
                        .id(orders.getId())
                        .name(orders.getCart().getUser().getName())
                        .email(orders.getCart().getUser().getEmail())
                        .checkIn(orders.getCart().getCheckIn())
                        .checkOut(orders.getCart().getCheckOut())
                        .price(orders.getCart().getPrice())
                        .paymentStatus(orders.getPaymentStatus())
                        .merchantUid(orders.getMerchantUid())
                        .price(orders.getPrice())
                        .houseDto(GetFindHouseDtoRes.toDto(house))
                        .build();

                dtoList.add(res);
            }
            return dtoList;
        }
        return Collections.emptyList();
    }





}
