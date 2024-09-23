package com.servicemycar.booking.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response<T> {

    private String statusCode;
    private String message;
    private T data;
}
