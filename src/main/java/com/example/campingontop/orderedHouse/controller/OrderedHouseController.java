package com.example.campingontop.orderedHouse.controller;

import com.example.campingontop.orderedHouse.model.dto.request.PostOrderedHouseDtoReq;
import com.example.campingontop.orderedHouse.model.dto.response.PostOrderedHouseDtoRes;
import com.example.campingontop.orderedHouse.service.OrderedHouseService;
import com.example.campingontop.user.model.User;
import io.opentracing.Span;
import io.opentracing.Tracer;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name="OrderedHouse", description = "OrderedHouse 숙소 결제 내역 CRUD")
@Api(tags = "OrderedHouse")
@RestController
@Slf4j
@RequiredArgsConstructor
@CrossOrigin("*")
@RequestMapping("/orderedHouse")
public class OrderedHouseController {
    private final OrderedHouseService orderedHouseService;
    private final Tracer tracer;

    @RequestMapping("/version")
    public ResponseEntity version() {
        Span parentSpan = tracer.scopeManager().activeSpan();
        Span spanPhase1 = tracer.buildSpan("spanPhase_1").asChildOf(parentSpan).start();
        try {
            spanPhase1.log("Test Micro Service Call.");
        } finally {
            spanPhase1.finish();
        }
        return ResponseEntity.ok().body("v3\n");
    }

    @PostMapping("/create")
    public ResponseEntity createOrdersProduct(PostOrderedHouseDtoReq req) {
        PostOrderedHouseDtoRes res = orderedHouseService.createOrderedHouse(req);
        return ResponseEntity.ok().body(res);
    }

    @GetMapping("/list")
    public ResponseEntity findOrdersProductList(@AuthenticationPrincipal User user) {
        List<PostOrderedHouseDtoRes> list = orderedHouseService.findOrderedHouseList(user.getId());
        return ResponseEntity.ok().body(list);
    }


}
