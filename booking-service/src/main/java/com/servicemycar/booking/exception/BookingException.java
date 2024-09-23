package com.servicemycar.booking.exception;

import org.springframework.http.HttpStatus;

public class BookingException extends RuntimeException{

    private HttpStatus httpStatus;

    public BookingException(){
        super();
    }

    public BookingException(HttpStatus httpStatus, String message){
        super(message);
        this.httpStatus = httpStatus;
    }
}
