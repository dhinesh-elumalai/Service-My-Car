package com.servicemycar.booking.service;

import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.repo.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarService {

    @Autowired
    private CarRepository carRepository;

    /**
     *
     * @param carData
     * @return
     */
    public CarData createCarData(CarData carData){
       return carRepository.save(carData);
    }

    /**
     *
     * @return
     */
    public List<CarData> getAllCars(){
        return carRepository.findAll();
    }

    /**
     *
     * @return
     */
    public CarData getCarByUserId(int userId){
        return carRepository.findByUserId(userId).get();
    }

    /**
     *
     * @return
     */
    public CarData getCarById(int carId){
        return carRepository.findById(carId).get();
    }

    /**
     *
     * @return
     */
    public String deleteCarById(int carId){
        carRepository.deleteById(carId);
        return "Car with id " +  carId + " is deleted successfully!";
    }

}
