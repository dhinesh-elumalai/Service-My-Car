package com.servicemycar.user.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class UserControllerAdvisor {

    @ExceptionHandler(UserException.class)
    public ResponseEntity<String> handleUserException(UserException userException) {
        return new ResponseEntity<>(userException.getMessage(), userException.getErrorCode());
    }
}
