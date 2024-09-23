package com.servicemycar.user.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Response<T> {

    private String statusCode;
    private String message;
    private T data;

    /**
     * Method to get Get Response Entity
     * @param statusCode Status Code
     * @param message Message
     * @param data Data
     * @param httpStatus Http Status
     * @return Response Entity
     */
    public ResponseEntity<Response<T>> getResponseEntity(
            String statusCode, String message, T data, HttpStatus httpStatus){
        return new ResponseEntity<>(new Response<T>(statusCode, message, data), httpStatus);
    }

}
