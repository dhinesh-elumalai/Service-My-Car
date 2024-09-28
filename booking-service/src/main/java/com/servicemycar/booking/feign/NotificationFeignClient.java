package com.servicemycar.booking.feign;

import com.servicemycar.booking.dto.BreakDownAlert;
import com.servicemycar.booking.dto.EmailDetails;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "notification-service", url = "http://localhost:2023", path = "/notifications")
public interface NotificationFeignClient {

    @PostMapping("/break-down-alert")
    ResponseEntity<String> sendBreakDownAlert(@RequestBody BreakDownAlert breakDownAlert);

    @PostMapping("/send-email/template")
    public ResponseEntity<String> sendEmailFromTemplate(@RequestBody EmailDetails emailDetails);

    @PostMapping("/send-email")
    public ResponseEntity<String> sendEmail(@RequestBody EmailDetails emailDetails);
}
