package com.servicemycar.booking.repo;


import com.servicemycar.booking.entity.CarData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CarRepository extends JpaRepository<CarData, Integer> {

    Optional<CarData> findByUsername(String username);
}
