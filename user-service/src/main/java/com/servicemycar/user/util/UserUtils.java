package com.servicemycar.user.util;

import com.servicemycar.user.dto.UserRequest;
import com.servicemycar.user.dto.UserResponse;
import com.servicemycar.user.entity.User;
import lombok.experimental.UtilityClass;
import org.yaml.snakeyaml.external.biz.base64Coder.Base64Coder;

@UtilityClass
public class UserUtils {

    /**
     *
     * @param user
     * @return
     */
    public static UserResponse convertUserToResponse(User user){
        return UserResponse.builder()
                .userId(user.getUserId())
                .name(user.getFirstName() + " " + user.getLastName())
                .email(user.getEmail())
                .role(user.getRole())
                .phone(user.getPhone())
                .address(user.getAddress())
                .adhaarNumber(user.getAdhaarNumber())
                .build();
    }

    /**
     * Method to convert userRequest class to User class
     * @param userRequest
     * @return User
     */
    public static User convertUserRequestToUser(UserRequest userRequest) {
        return User.builder()
                .username(userRequest.getEmail())
                .firstName(userRequest.getFirstName())
                .lastName(userRequest.getLastName())
                .email(userRequest.getEmail())
                .phone(userRequest.getPhone())
                .address(userRequest.getAddress())
                .adhaarNumber(userRequest.getAdhaarNumber())
                .password(Base64Coder.encodeString(userRequest.getPassword()))
                .role(userRequest.getCreatedBy().equalsIgnoreCase("ADMIN") ? "ADMIN" : userRequest.getUserType())
                .status("Active")
                .isActive(true)
                .build();
    }

}
