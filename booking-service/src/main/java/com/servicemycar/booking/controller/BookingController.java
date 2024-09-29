package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.dto.BreakDownData;
import com.servicemycar.booking.entity.Appointment;
import com.servicemycar.booking.service.AppointmentService;
import com.servicemycar.booking.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin("*")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private AppointmentService appointmentService;

    @PostMapping(value = "/appointments")
    public ResponseEntity<Response<?>> bookService(@RequestBody Appointment appointment){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointment booked successfully",
                appointmentService.createAppointment(appointment)));
    }


    @GetMapping(value = "/appointments")
    public ResponseEntity<Response<?>> getAllBookings(){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointments List Fetched successfully",
                appointmentService.getAllAppointments()));
    }



    @GetMapping(value = "/appointments/service-centers/{id}")
    public ResponseEntity<Response<?>> getAllBookings(@PathVariable("id") String serviceCenterId){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointments List Fetched successfully",
                appointmentService.getAllAppointments()));
    }


    @GetMapping(value = "/users/appointments/{username}")
    public ResponseEntity<Response<?>> getBookingsByUsername(@PathVariable("username") String username){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointments List Fetched successfully",
                appointmentService.getAppointmentByUsername(username)));
    }


    @GetMapping(value = "/service-center/appointments/{id}")
    public ResponseEntity<Response<?>> getAllAppointmentByServiceCenterId(@PathVariable("id") String serviceCenterId){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointments List Fetched successfully",
                appointmentService.getAppointmentsByServiceCenterId(serviceCenterId)));
    }


    @PutMapping(value = "/appointments/{id}")
    public ResponseEntity<Response<?>> updateBookings(
            @PathVariable("id") int appointmentId, @RequestParam(value = "isConfirmed", required = false) Boolean isConfirmed,
            @RequestParam(value = "isCompleted", required = false) Boolean isCompleted){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointment updated successfully",
                appointmentService.updateAppointment(appointmentId, isConfirmed, isCompleted)));
    }


    @DeleteMapping(value = "/appointments/{appointmentId}")
    public ResponseEntity<Response<?>> cancelBooking(@PathVariable("id") long appointmentId){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointment deleted successfully",
                appointmentService.deleteAppointmentById(appointmentId)));
    }


    @PostMapping(value = "/breakdown-notification")
    public ResponseEntity<Response<?>> notifyBreakDown(@RequestBody BreakDownData breakDownData){
        return ResponseEntity.ok(new Response<>("1200", bookingService.sendBreakDownAlert(breakDownData), "Success"));
    }

}
