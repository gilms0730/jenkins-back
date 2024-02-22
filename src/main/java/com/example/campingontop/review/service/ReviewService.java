package com.example.campingontop.review.service;


import com.example.campingontop.aws.service.S3Service;
import com.example.campingontop.exception.ErrorCode;
import com.example.campingontop.exception.entityException.ReviewException;
import com.example.campingontop.orders.model.Orders;
import com.example.campingontop.orders.repository.OrdersRepository;
import com.example.campingontop.review.model.request.GetReviewListPagingByLocReq;
import com.example.campingontop.review.model.request.PatchUpdateReviewDtoReq;
import com.example.campingontop.review.model.response.GetFindReviewDtoRes;
import com.example.campingontop.review.model.response.PatchUpdateReviewDtoRes;
import com.example.campingontop.review.model.response.PostCreateReviewDtoRes;
import com.example.campingontop.reviewImage.model.ReviewImage;
import com.example.campingontop.reviewImage.service.ReviewImageService;
import com.example.campingontop.review.model.Review;
import com.example.campingontop.review.model.request.PostCreateReviewDtoReq;
import com.example.campingontop.review.repository.ReviewRepository;
import com.example.campingontop.user.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final ReviewImageService reviewImageService;
    private final S3Service s3Service;
    private final OrdersRepository ordersRepository;

    @Transactional
    public PostCreateReviewDtoRes createReview(User user, PostCreateReviewDtoReq request, MultipartFile[] images) {

        Orders orders = reviewRepository.whichOrdersYouveReviewing(user,request);
        Review review = Review.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .rating(request.getRating())
                .orders(orders)
                .status(true)
                .build();
        review = reviewRepository.save(review);

        reviewImageService.createImage(review.getId(), images);
        PostCreateReviewDtoRes response = PostCreateReviewDtoRes.toDto(review);

        return response;
    }
    @Transactional(readOnly = true)
    public GetFindReviewDtoRes findReviewById(Long reviewId) {
        Review result = reviewRepository.findReviewById(reviewId);
        if (result != null) {
            Review review = result;
            List<ReviewImage> reviewImageList = review.getReviewImageList();

            List<String> filenames = new ArrayList<>();

            for (ReviewImage reviewImage : reviewImageList) {
                String filename = reviewImage.getFilename();
                filenames.add(filename);
            }

            GetFindReviewDtoRes res = GetFindReviewDtoRes.toDto(review, filenames);
            return res;
        }
        throw new ReviewException(ErrorCode.REVIEW_NOT_EXIST);
    }

    @Transactional(readOnly = true)
    //추후 수정 필요, 기능 구현 아직 안됨.
    public List<GetFindReviewDtoRes> findReviewList(GetReviewListPagingByLocReq req) {
        Pageable pageable = PageRequest.of(req.getPage()-1, req.getSize());
        Page<Review> result = reviewRepository.findList(pageable);

        List<GetFindReviewDtoRes> reviewList = new ArrayList<>();

        for (Review review : result.getContent()) {
            List<ReviewImage> reviewImageList = review.getReviewImageList();

            List<String> filenames = new ArrayList<>();
            for (ReviewImage productImage : reviewImageList) {
                String filename = productImage.getFilename();
                filenames.add(filename);
            }

            GetFindReviewDtoRes res = GetFindReviewDtoRes.toDto(review, filenames);
            reviewList.add(res);
        }
        return reviewList;
    }

    public PatchUpdateReviewDtoRes updateReview(User user, PatchUpdateReviewDtoReq req, Long reviewId) {
        Optional<Review> result = reviewRepository.findById(reviewId);
        if (result.isPresent()) {
            Review review = result.get();

            review.setTitle(req.getTitle());
            review.setContent(req.getContent());
            review.setRating(req.getRating());

            review = reviewRepository.save(review);

            PatchUpdateReviewDtoRes res = PatchUpdateReviewDtoRes.toDto(review);
            return res;
        }
        throw new ReviewException(ErrorCode.REVIEW_NOT_EXIST);
    }

    public void deleteReview(User user, Long reviewId) {
        Optional<Review> result = reviewRepository.findActiveReviewForDelete(user, reviewId);
        if (result.isPresent()) {
            Review review = result.get();
            review.setStatus(false);
            reviewRepository.save(review);
            return;
        }
        throw new ReviewException(ErrorCode.REVIEW_NOT_EXIST);
    }



//
//    public Optional<Review> getReviewById(Long id) {
//        return reviewRepository.findById(id);
//    }
//
//    public List<Review> getReviewsByNewest() {
//        // 최신 순 조회 메서드를 createdAt 필드를 기준으로 정렬하도록 변경
//        return reviewRepository.findAllByOrderByCreatedAtDesc();
//    }
//
//    public List<Review> getReviewsByHighestRating() {
//        return reviewRepository.findAllByOrderByRatingDesc();
//    }
//
//    public Double getAverageRating() {
//        return reviewRepository.findAverageRating();
//    }
//
//    public List<Review> getReviewsByLowestRating() {
//        return reviewRepository.findAllByOrderByRatingAsc();
//    }
//
//    @Transactional
//    public Review updateReview(Long id, ReviewUpdateDTO reviewUpdateDTO, MultipartFile[] images) throws IOException {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//
//        if (authentication.getPrincipal() instanceof UserDetails) {
//            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//
//            Review review = reviewRepository.findById(id)
//                    .orElseThrow(() -> new IllegalStateException("Review not found"));
//
//            if (!review.getUser().getUsername().equals(userDetails.getUsername())) {
//                throw new IllegalStateException("당신은 이 리뷰의 작성자가 아닙니다.");
//            }   // 리뷰 작성 유저와 유저 디테일을 통해 받아온 유저가 다르면 예외처리
//
//                // 타이틀이 비어있지 않으면 타이틀도 수정
//            if (reviewUpdateDTO.getTitle() != null) {
//                review.setTitle(reviewUpdateDTO.getTitle());
//            }
//
//            review.setContent(reviewUpdateDTO.getContent());
//            review.setRating(reviewUpdateDTO.getRating());
//
//            review = reviewRepository.save(review);
//
//            if (images != null && images.length > 0) {
//                reviewImageService.createImage(review.getId(), images);
//            }
//
//            return review;
//        } else {
//            throw new IllegalStateException("인증된 사용자 정보를 가져올 수 없습니다.");
//        }
//    }
//
//
//    @Transactional
//    public void deleteReview(Long id) {
//        reviewRepository.deleteById(id);
//    }
}
