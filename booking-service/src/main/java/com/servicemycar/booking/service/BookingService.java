package com.servicemycar.booking.service;

import com.servicemycar.booking.dto.BreakDownAlert;
import com.servicemycar.booking.dto.BreakDownData;
import com.servicemycar.booking.dto.UserResponse;
import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.entity.ServiceCenter;
import com.servicemycar.booking.feign.NotificationFeignClient;
import com.servicemycar.booking.feign.UsersFeignClient;
import com.servicemycar.booking.repo.CarRepository;
import com.servicemycar.booking.repo.ServiceCenterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
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
        Optional<CarData> car = carRepository.findByUserId(userData.getUserId());
        if(car.isEmpty()){
            throw new RuntimeException("User does not have a car owned");
        }
        BreakDownAlert breakDownAlert = new BreakDownAlert();
        breakDownAlert.setCarModel(car.get().getModel());
        breakDownAlert.setLatitude(breakDownData.getLatitude());
        breakDownAlert.setLongitude(breakDownAlert.getLongitude());
        breakDownAlert.setEmail(userData.getEmail());
        breakDownAlert.setMobile(userData.getPhone());
        breakDownAlert.setLocation("Villupuram");
        breakDownAlert.setLocationLink("https://maps.app.goo.gl/To96Z3XxxnByayp49");
        List<String> recipients = serviceCenterRepository.findByCity("Villupuram").stream().map(ServiceCenter::getEmail).collect(Collectors.toList());
        breakDownAlert.setRecipients(recipients);
        var notifyResponse = notificationClient.sendBreakDownAlert(breakDownAlert);
        if(notifyResponse.getStatusCode().is2xxSuccessful()){
            return "Service Centers Notified Successfully!";
        } else{
            return "Error notifying Service Centers!";
        }
    }

}
