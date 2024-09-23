package com.servicemycar.booking.feign;

import com.servicemycar.booking.dto.BreakDownAlert;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "notification-service", url = "http://localhost:9092", path = "/notifications")
public interface NotificationFeignClient {

    @PostMapping("/break-down-alert")
    ResponseEntity<String> sendBreakDownAlert(@RequestBody BreakDownAlert breakDownAlert);

}
