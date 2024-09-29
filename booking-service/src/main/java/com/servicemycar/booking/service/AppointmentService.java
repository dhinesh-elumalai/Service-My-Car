package com.servicemycar.booking.service;

import com.servicemycar.booking.entity.Appointment;
import com.servicemycar.booking.exception.BookingException;
import com.servicemycar.booking.repo.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AppointmentService {

    @Autowired
    private AppointmentRepository appointmentRepository;

    /**
     * @param appointment
     * @return
     */
    public Appointment createAppointment(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }

    /**
     * @return
     */
    public List<Appointment> getAllAppointments() {
        return appointmentRepository.findAll();
    }

    /**
     * @return
     */
    public List<Appointment> getAppointmentByUsername(String username) {
        return appointmentRepository.findByUsername(username);
    }

    /**
     * @return
     */
    public List<Appointment> getAppointmentsByServiceCenterId(String serviceCenterId) {
        return appointmentRepository.findByServiceCenterUsername(serviceCenterId);
    }

    /**
     * @return
     */
    public Appointment getAppointmentById(long appointmentId) {
        return appointmentRepository.findById(appointmentId).get();
    }

    /**
     * @return
     */
    public String deleteAppointmentById(long appointmentId) {
        Optional<Appointment> appointmentOptional = appointmentRepository.findById(appointmentId);
        if (appointmentOptional.isEmpty())
            throw new BookingException(HttpStatus.BAD_REQUEST, "Invalid Appointment Id");
        appointmentRepository.deleteById(appointmentId);
        return "Appointment with id " + appointmentId + " is deleted successfully!";
    }


    /**
     * @return
     */
    public String updateAppointment(long appointmentId, Boolean isConfirmed, Boolean isCompleted) {
        Optional<Appointment> appointmentOptional = appointmentRepository.findById(appointmentId);
        if (appointmentOptional.isEmpty())
            throw new BookingException(HttpStatus.BAD_REQUEST, "Invalid Appointment Id");
        var appointment = appointmentOptional.get();
        if (isCompleted != null) {
            appointment.setCompleted(isCompleted);
        }
        if (isConfirmed != null) {
            appointment.setConfirmed(isConfirmed);
        }
        appointmentRepository.save(appointment);
        return "Appointment with id " + appointmentId + " is updated successfully!";
    }
}
