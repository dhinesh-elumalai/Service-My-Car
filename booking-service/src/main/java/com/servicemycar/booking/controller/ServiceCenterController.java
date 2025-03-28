package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.entity.ServiceCenter;
import com.servicemycar.booking.service.ServiceCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
public class ServiceCenterController {

    @Autowired
    private ServiceCenterService carService;

    /**
     *
     * @param carData ServiceCenter
     * @return ServiceCenter
     */
    @PostMapping("/service-center")
    public ResponseEntity<Response<ServiceCenter>> createServiceCenter( @RequestBody ServiceCenter carData) {
        return new Response<ServiceCenter>().getSuccessResponse("ServiceCenter created Successfully",
                carService.createServiceCenter(carData));
    }

    /**
     * Get service centers
     * @return List<ServiceCenter>
     */
    @GetMapping("/service-center")
    public ResponseEntity<Response<List<ServiceCenter>>> getServiceCenters() {
        return new Response<List<ServiceCenter>>().getSuccessResponse("ServiceCenters fetched Successfully!",
                carService.getAllServiceCenters());
    }


    /**
     * Get service centers
     * @return ServiceCenter
     */
    @GetMapping("/service-center/{serviceCenterId}")
    public ResponseEntity<Response<ServiceCenter>> getServiceCenters(@PathVariable("serviceCenterId") int serviceCenterId) {
        return new Response<ServiceCenter>().getSuccessResponse("ServiceCenter fetched Successfully!",
                carService.getServiceCenterById(serviceCenterId));
    }


    /**
     * Get service center by city
     * @return List<ServiceCenter>
     */
    @GetMapping("/service-center/cities/{city}")
    public ResponseEntity<Response<List<ServiceCenter>>> getServiceCentersByCity(@PathVariable("city") String city) {
        return new Response<List<ServiceCenter>>().getSuccessResponse("ServiceCenter fetched Successfully!",
                carService.getServiceCentersByCity(city));
    }


    /**
     * Get service center by city
     * @return List<ServiceCenter>
     */
    @GetMapping("/service-center/users/{username}")
    public ResponseEntity<Response<List<ServiceCenter>>> getServiceCentersByUsername(@PathVariable("username") String username) {
        return new Response<List<ServiceCenter>>().getSuccessResponse("ServiceCenter fetched Successfully!",
                carService.getServiceCentersByUsername(username));
    }


    /**
     * Update service center
     * @return ServiceCenter
     */
    @DeleteMapping("/service-center/{serviceCenterId}")
    public ResponseEntity<Response<String>> deleteServiceCenterById(@PathVariable("carId") int carId) {
        return new Response<String>().getSuccessResponse("ServiceCenter deleted Successfully!",
                carService.deleteServiceCenterById(carId));
    }
}
