package com.servicemycar.user.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

import java.io.Serial;

@Getter
public class UserException extends RuntimeException{

    @Serial
    private static final long serialVersionUID = 1L;

    private HttpStatus errorCode;

    public UserException(){
        super();
    }

    public UserException( HttpStatus status, String message){
        super(message);
        this.errorCode=status;
    }
}
