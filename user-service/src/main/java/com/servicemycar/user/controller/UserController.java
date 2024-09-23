package com.servicemycar.user.controller;

import com.servicemycar.user.common.Response;
import com.servicemycar.user.dto.LoginRequest;
import com.servicemycar.user.dto.LoginResponse;
import com.servicemycar.user.dto.UserRequest;
import com.servicemycar.user.dto.UserResponse;
import com.servicemycar.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {


    @Autowired
    private UserService userService;

    @PostMapping(value = "/users", produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<UserResponse>> createUser(@RequestBody UserRequest userRequest) {
        UserResponse userResponse = userService.createUser(userRequest);
        return new Response<UserResponse>().getResponseEntity("1201",
                "User Created Successfully!", userResponse, HttpStatus.CREATED);
    }

    @GetMapping(value = "/users", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<List<UserResponse>>> getAllUsers() {
        List<UserResponse> usersList = userService.getAllUsers();
        return new Response<List<UserResponse>>().getResponseEntity("1200",
                "Users Fetched Successfully!", usersList, HttpStatus.OK);
    }

    @GetMapping(value = "/users/{userId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<UserResponse>> getUser(@PathVariable("userId") int userId) {
       UserResponse userResponse = userService.getUserById(userId);
        return new Response<UserResponse>().getResponseEntity("1200",
                "User Fetched Successfully!", userResponse, HttpStatus.OK);
    }


    @PostMapping(value = "/users/login", produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<LoginResponse>> loginUser(@RequestBody LoginRequest loginRequest) {
        LoginResponse loginResponse = userService.login(loginRequest);
        return new Response<LoginResponse>().getResponseEntity("1200",
                "Logged in Successfully!", loginResponse, HttpStatus.OK);
    }

    @GetMapping(value = "/users/username/{username}", produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<Response<UserResponse>> getUserByUsername(@PathVariable("username") String username){
        return new Response<UserResponse>().getResponseEntity("1200",
                "Logged in Successfully!", userService.getUserByUsername(username), HttpStatus.OK);
    }


}
