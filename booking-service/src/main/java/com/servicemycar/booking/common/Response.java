package com.servicemycar.booking.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response<T> {

    private String statusCode;
    private String message;
    private T data;

    public ResponseEntity<Response<T>> getSuccessResponse(String message, T data){
        return new ResponseEntity<>(new Response<>("1200",message,data), HttpStatus.OK);
    }

}
