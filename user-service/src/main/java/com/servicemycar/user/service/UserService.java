package com.servicemycar.user.service;

import com.servicemycar.user.dto.LoginRequest;
import com.servicemycar.user.dto.LoginResponse;
import com.servicemycar.user.dto.UserRequest;
import com.servicemycar.user.dto.UserResponse;
import com.servicemycar.user.entity.User;
import com.servicemycar.user.exception.UserException;
import com.servicemycar.user.repos.UserRepository;
import com.servicemycar.user.util.JWTUtils;
import com.servicemycar.user.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.external.biz.base64Coder.Base64Coder;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {


    @Autowired
    private UserRepository userRepository;

    /**
     * Get all users
     *
     * @return List<UserResponse>
     */
    public List<UserResponse> getAllUsers() {
        List<User> users = userRepository.findAll();
        return users.stream().map(UserUtils::convertUserToResponse).collect(Collectors.toList());
    }

    /**
     * Get user by id
     *
     * @param id user id
     * @return UserResponse
     */
    public UserResponse getUserById(int id) {
        User user = userRepository.findById(id).orElseThrow(() -> new UserException(HttpStatus.OK, "User Not Found!!"));
        return UserUtils.convertUserToResponse(user);
    }

    /**
     * Get user by id
     *
     * @param username user id
     * @return UserResponse
     */
    public UserResponse getUserByUsername(String username) {
        User user = userRepository.findByUsername(username).orElseThrow(() -> new UserException(HttpStatus.OK, "User Not Found!!"));
        return UserUtils.convertUserToResponse(user);
    }

    /**
     * Create user
     *
     * @param userRequest UserRequest
     * @return UserResponse
     */
    public UserResponse createUser(UserRequest userRequest) {
        User user = UserUtils.convertUserRequestToUser(userRequest);
        try {
            User savedUser = userRepository.save(user);
            return UserUtils.convertUserToResponse(savedUser);
        }
        catch (DataIntegrityViolationException exception){
            throw new UserException(HttpStatus.BAD_REQUEST, Objects.requireNonNull(exception.getRootCause()).getMessage());
        }
    }


    /**
     * Method for logging in
     *
     * @param loginRequest Login Request dto with username and password
     * @return Token and expiryTime
     */
    public LoginResponse login(LoginRequest loginRequest) {
        Optional<User> userOptional = userRepository.findByUsername(loginRequest.getUsername());
        User user = userOptional.orElseThrow(() -> new UserException(HttpStatus.UNAUTHORIZED, "Invalid Username!!"));
        if (!user.getPassword().equals(Base64Coder.encodeString(loginRequest.getPassword()))) {
            throw new UserException(HttpStatus.UNAUTHORIZED, "Invalid Password!!");
        }
        String jwtToken = JWTUtils.generateToken(user);
        return LoginResponse.builder().jwtToken(jwtToken).expiryTime(System.currentTimeMillis() + JWTUtils.EXPIRATION_TIME).build();
    }
}
