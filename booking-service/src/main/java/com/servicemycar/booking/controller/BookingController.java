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


    @PutMapping(value = "/appointments/{appointmentId}")
    public ResponseEntity<Response<?>> updateBookings(
            @PathVariable("id") long appointmentId, @RequestParam(value = "isConfirmed") Boolean isConfirmed,
            @RequestParam(value = "isCompleted") Boolean isCompleted){
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
