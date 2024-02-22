package com.example.campingontop.user.service;

import com.example.campingontop.enums.Gender;

import com.example.campingontop.exception.ErrorCode;
import com.example.campingontop.exception.entityException.UserException;
import com.example.campingontop.user.model.User;
import com.example.campingontop.user.model.request.PostCreateUserDtoReq;
import com.example.campingontop.user.model.request.PostLoginUserDtoReq;
import com.example.campingontop.user.model.request.PutUpdateUserDtoReq;
import com.example.campingontop.user.model.request.SendEmailDtoReq;
import com.example.campingontop.user.model.response.*;
import com.example.campingontop.user.repository.queryDsl.UserRepository;
import com.example.campingontop.utils.JwtUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final JavaMailSender emailSender;
    private final EmailVerifyService emailVerifyService;
    private final KafkaTemplate kafkaTemplate;

    @Value("${jwt.secret-key}")
    private String secretKey;

    @Value("${message.set.from}")
    private String originEmail;

    @Value("${message.set.text}")
    private String messageText;

    @Value("${message.set.subject1}")
    private String messageSubject1;

    @Value("${message.set.subject2}")
    private String messageSubject2;

    @Value("${message.set.subject3}")
    private String messageSubject3;

    public PostSignUpUserDtoRes signUpUser(PostCreateUserDtoReq request) {
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new UserException(ErrorCode.DUPLICATED_EMAIL);
        }

        User user = User.toEntity(request);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setAuthority("ROLE_USER");

        user = userRepository.save(user);


        SendEmailDtoReq req = SendEmailDtoReq.toDto(user.getId(), user.getEmail(), user.getNickName());
        sendEmail(req);

        /*
        ProducerRecord<String, String> record = new ProducerRecord<>("emailcert", "email", user.getEmail());
        kafkaTemplate.send(record);
        */

        PostSignUpUserDtoRes res = PostSignUpUserDtoRes.toDto(user);

        return res;
    }


    public PostSignUpUserDtoRes signUpSeller (PostCreateUserDtoReq request) {
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new UserException(ErrorCode.DUPLICATED_EMAIL);
        }

        User user = User.toEntity(request);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setAuthority("ROLE_SELLER");

        user = userRepository.save(user);


        SendEmailDtoReq req = SendEmailDtoReq.toDto(user.getId(), user.getEmail(), user.getNickName());
        sendEmail(req);

        /*
        ProducerRecord<String, String> record = new ProducerRecord<>("emailcert", "email", user.getEmail());
        kafkaTemplate.send(record);
        */

        PostSignUpUserDtoRes res = PostSignUpUserDtoRes.toDto(user);

        return res;
    }


    public void sendEmail(SendEmailDtoReq req) {
        String token = UUID.randomUUID().toString();

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(originEmail);
        message.setTo(req.getEmail());
        message.setSentDate(new Date(System.currentTimeMillis()));
        message.setSubject("["+messageSubject1+"] "+messageSubject2+" "+messageSubject3);
        message.setText(messageText
                + req.getEmail()
                + "&token=" + token
                + "&jwt=" + JwtUtils.generateAccessToken(req.getEmail(), req.getNickName(), req.getId(), secretKey)
        );
        emailSender.send(message);

        emailVerifyService.create(req.getEmail(), token);
    }


    public PostLoginUserDtoRes login(PostLoginUserDtoReq req) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword()));

        if (authentication.isAuthenticated()) {
            Long id = ((User) authentication.getPrincipal()).getId();
            String email = ((User) authentication.getPrincipal()).getEmail();
            String nickname = ((User) authentication.getPrincipal()).getNickName();

            String jwt = JwtUtils.generateAccessToken(email, nickname, id, secretKey);

            PostLoginUserDtoRes loginRes = PostLoginUserDtoRes.builder()
                    .token(jwt)
                    .build();

            return loginRes;
        }
        throw new UserException(ErrorCode.AUTHENTICATION_FAIL);
    }


    public void updateMemberStatus(String email) {
        Optional<User> result = userRepository.findByEmail(email);
        if(result.isPresent()) {
            User member = result.get();
            member.setStatus(true);
            userRepository.save(member);
            return;
        }
        throw new UserException(ErrorCode.MEMBER_NOT_EXIST);
    }


    public GetFindUserDtoRes findUserById(Long userId) {
        Optional<User> result = userRepository.findById(userId);
        if (result.isPresent()) {
            User user = result.get();

            return GetFindUserDtoRes.toDto(user);
        }
        throw new UserException(ErrorCode.MEMBER_NOT_EXIST);
    }

    public List<GetFindUserDtoRes> findUserList() {
        return userRepository.findActiveUserList();
    }

    public PutUpdateUserDtoRes updateUser(PutUpdateUserDtoReq req, Long userId) {
        Optional<User> result = userRepository.findById(userId);
        if (result.isPresent()) {
            User user = result.get();

            user.setPassword(req.getPassword());
            user.setName(req.getName());
            user.setNickName(req.getNickName());
            user.setPhoneNum(req.getPhoneNum());
            user.setGender(Gender.fromValue(req.getGender()));

            user = userRepository.save(user);

            PutUpdateUserDtoRes res = PutUpdateUserDtoRes.toDto(user);
            return res;
        }
        throw new UserException(ErrorCode.MEMBER_NOT_EXIST);
    }

    public void deleteUser(Long userId) {
        Optional<User> result = userRepository.findById(userId);
        if (result.isPresent()) {
            User user = result.get();
            user.setStatus(false);
            userRepository.save(user);
            return;
        }
        throw new UserException(ErrorCode.MEMBER_NOT_EXIST);
    }
}
