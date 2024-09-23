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
public class LoginResponse {

    @JsonProperty("jwt_token")
    private String jwtToken;

    @JsonProperty("expiry_time")
    private long expiryTime;

}
