package com.servicemycar.booking.service;

import com.servicemycar.booking.dto.BreakDownAlert;
import com.servicemycar.booking.dto.BreakDownData;
import com.servicemycar.booking.dto.UserResponse;
import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.entity.ServiceCenter;
import com.servicemycar.booking.exception.BookingException;
import com.servicemycar.booking.feign.NotificationFeignClient;
import com.servicemycar.booking.feign.UsersFeignClient;
import com.servicemycar.booking.repo.CarRepository;
import com.servicemycar.booking.repo.ServiceCenterRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
public class BookingService {


    @Autowired
    private NotificationFeignClient notificationClient;

    @Autowired
    private UsersFeignClient usersClient;

    @Autowired
    private CarRepository carRepository;

    @Autowired
    private ServiceCenterRepository serviceCenterRepository;

    /**
     *
     * @param breakDownData
     * @return
     */
    public String sendBreakDownAlert(BreakDownData breakDownData){
        UserResponse userData = new UserResponse();
        var response = usersClient.getUserByUsername(breakDownData.getUsername());
        if(response.getStatusCode().is2xxSuccessful()){
            userData = Objects.requireNonNull(response.getBody()).getData();
        }
        Optional<CarData> car = carRepository.findByUsername(breakDownData.getUsername());
        if(car.isEmpty()){
            throw new BookingException(HttpStatus.BAD_REQUEST, "User does not have a car owned");
        }
        BreakDownAlert breakDownAlert = new BreakDownAlert();
        breakDownAlert.setCarModel(car.get().getModel());
        breakDownAlert.setName(userData.getName());
        breakDownAlert.setLatitude(breakDownData.getLatitude());
        breakDownAlert.setLongitude(breakDownData.getLongitude());
        breakDownAlert.setEmail(userData.getEmail());
        breakDownAlert.setMobile(userData.getPhone());
        breakDownAlert.setLocation(userData.getAddress());
        breakDownAlert.setLocationLink(breakDownData.getLocationLink());
        List<String> recipients = serviceCenterRepository.findByCity(userData.getAddress()).stream().map(ServiceCenter::getEmail).collect(Collectors.toList());
        breakDownAlert.setRecipients(recipients);
        log.info("Sending Notification Request {}", breakDownAlert);
        var notifyResponse = notificationClient.sendBreakDownAlert(breakDownAlert);
        if(notifyResponse.getStatusCode().is2xxSuccessful()){
            return "Service Centers Notified Successfully!";
        } else{
            return "Error notifying Service Centers!";
        }
    }

}
