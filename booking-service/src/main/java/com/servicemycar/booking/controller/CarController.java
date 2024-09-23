package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CarController {


    @Autowired
    private CarService carService;

    /**
     *
     * @param carData
     * @return
     */
    @PostMapping("/cars")
    public ResponseEntity<Response<CarData>> createCar(CarData carData) {
        return new Response<CarData>().getSuccessResponse("Car created Successfully",
                carService.createCarData(carData));
    }

    /**
     *67hjghh67862333334rew
     * @return
     */
    @GetMapping("/cars")
    public ResponseEntity<Response<List<CarData>>> getCars() {
        return new Response<List<CarData>>().getSuccessResponse("Cars fetched Successfully!",
                carService.getAllCars());
    }


    /**
     *67hjghh67862333334rew
     * @return
     */
    @GetMapping("/cars/{carId}")
    public ResponseEntity<Response<CarData>> getCars(@PathVariable("carId") int carId) {
        return new Response<CarData>().getSuccessResponse("Car fetched Successfully!",
                carService.getCarById(carId));
    }


    /**
     *67hjghh67862333334rew
     * @return
     */
    @GetMapping("/cars/users/{ownerId}")
    public ResponseEntity<Response<CarData>> getCarByUserId(@PathVariable("ownerId") int ownerId) {
        return new Response<CarData>().getSuccessResponse("Car fetched Successfully!",
                carService.getCarByUserId(ownerId));
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

