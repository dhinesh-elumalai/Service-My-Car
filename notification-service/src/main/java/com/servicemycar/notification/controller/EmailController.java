package com.servicemycar.notification.controller;


import com.servicemycar.notification.dto.BreakDownAlert;
import com.servicemycar.notification.model.EmailDetails;
import com.servicemycar.notification.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmailController {

    @Autowired
    private NotificationService emailService;

    @PostMapping("/break-down-alert")
    public ResponseEntity<String> sendBreakDownAlert(@RequestBody BreakDownAlert breakDownAlert){
        emailService.sendBreakDownAlert(breakDownAlert);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }



    @PostMapping("/send-email/template")
    public ResponseEntity<String> sendEmailFromTemplate(@RequestBody EmailDetails emailDetails){
        emailService.sendEmailFromTemplate(emailDetails);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }


    @PostMapping("/send-email")
    public ResponseEntity<String> sendEmail(@RequestBody EmailDetails emailDetails){
        emailService.sendEmail(emailDetails);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }
}