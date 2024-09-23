package com.servicemycar.booking.service;

import com.servicemycar.booking.entity.ServiceCenter;
import com.servicemycar.booking.repo.ServiceCenterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceCenterService {
    
    @Autowired
    private ServiceCenterRepository serviceCenterRepository;

    /**
     *
     * @param serviceCenter
     * @return
     */
    public ServiceCenter createServiceCenter(ServiceCenter serviceCenter){
        return serviceCenterRepository.save(serviceCenter);
    }

    /**
     *
     * @return
     */
    public List<ServiceCenter> getAllServiceCenters(){
        return serviceCenterRepository.findAll();
    }

    /**
     *
     * @return
     */
    public List<ServiceCenter> getServiceCentersByCity(String city){
        return serviceCenterRepository.findByCity(city);
    }

    /**
     *
     * @return
     */
    public ServiceCenter getServiceCenterById(int carId){
        return serviceCenterRepository.findById(carId).get();
    }

    /**
     *
     * @return
     */
    public String deleteServiceCenterById(int carId){
        serviceCenterRepository.deleteById(carId);
        return "ServiceCenter with id " +  carId + " is deleted successfully!";
    }

}
