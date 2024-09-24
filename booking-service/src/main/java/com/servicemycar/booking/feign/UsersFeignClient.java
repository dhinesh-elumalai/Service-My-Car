package com.servicemycar.booking.feign;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.dto.UserResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "user-service", url = "http://localhost:2022", path = "/users")
public interface UsersFeignClient {

    @GetMapping(value = "/users", produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<Response<List<UserResponse>>> getAllUsers();

    @GetMapping(value = "/users/{userId}", produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<Response<UserResponse>> getUser(@PathVariable("userId") int userId);

    @GetMapping(value = "/users/username/{username}", produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<Response<UserResponse>> getUserByUsername(@PathVariable("username") String username);

}
