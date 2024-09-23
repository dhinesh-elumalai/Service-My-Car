package com.servicemycar.user.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class LoginRequest {

    @NotBlank(message = "username cannot be null / blank")
    private String username;

    @NotBlank(message = "password cannot be null / blank")
    private String password;
    
}
