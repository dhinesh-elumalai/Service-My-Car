package com.servicemycar.booking.repo;

import com.servicemycar.booking.entity.ServiceCenter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceCenterRepository extends JpaRepository<ServiceCenter, Integer> {

    List<ServiceCenter> findByCity(String city);
    List<ServiceCenter> findByEmail(String email);
}
