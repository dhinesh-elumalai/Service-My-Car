package com.servicemycar.booking.repo;

import com.servicemycar.booking.entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

    List<Appointment> findByUsername(String username);

    List<Appointment> findByServiceCenterUsername(String serviceCenterUsername);
}
