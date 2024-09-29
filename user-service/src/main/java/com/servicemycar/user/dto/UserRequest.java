package com.servicemycar.user.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserRequest {

    @JsonProperty(value = "username")
    private String userName;
    @JsonProperty(value = "firstName")
    private String firstName;
    @JsonProperty(value = "lastName")
    private String lastName;
    @JsonProperty(value = "email")
    private String email;
    @JsonProperty(value = "phone")
    private String phone;
    @JsonProperty(value = "address")
    private String address;
    @JsonProperty(value = "password")
    private String password;
    @JsonProperty(value = "createdBy")
    private String createdBy;
    @JsonProperty(value = "userType")
    private String userType;
}
