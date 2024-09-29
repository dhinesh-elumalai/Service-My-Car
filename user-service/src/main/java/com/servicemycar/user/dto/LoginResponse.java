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

    @JsonProperty("jwtToken")
    private String jwtToken;

    @JsonProperty("expiryTime")
    private long expiryTime;

}
