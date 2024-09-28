package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CarController {


    @Autowired
    private CarService carService;

    /**
     * Create a new car
     * @param carData CarData
     * @return CarData
     */
    @PostMapping("/cars")
    public ResponseEntity<Response<CarData>> createCar(CarData carData) {
        return new Response<CarData>().getSuccessResponse("Car created Successfully",
                carService.createCarData(carData));
    }

    /**
     * Get all cars
     * @return List of cars
     */
    @GetMapping("/cars")
    public ResponseEntity<Response<List<CarData>>> getCars() {
        return new Response<List<CarData>>().getSuccessResponse("Cars fetched Successfully!",
                carService.getAllCars());
    }


    /**
     *  Get Car by Id
     * @return CarData
     */
    @GetMapping("/cars/{carId}")
    public ResponseEntity<Response<CarData>> getCars(@PathVariable("carId") int carId) {
        return new Response<CarData>().getSuccessResponse("Car fetched Successfully!",
                carService.getCarById(carId));
    }


    /**
     * Get Cars by user Id
     * @return
     */
    @GetMapping("/cars/users/{username}")
    public ResponseEntity<Response<CarData>> getCarByUserId(@PathVariable("username") String ownerId) {
        return new Response<CarData>().getSuccessResponse("Car fetched Successfully!",
                carService.getCarByUsername(ownerId));
    }


    /**
     *67hjghh67862333334rew
     * @return
     */
    @DeleteMapping("/cars/{carId}")
    public ResponseEntity<Response<String>> deleteCaryId(@PathVariable("carId") int carId) {
        return new Response<String>().getSuccessResponse("Car deleted Successfully!",
                carService.deleteCarById(carId));
    }

}

