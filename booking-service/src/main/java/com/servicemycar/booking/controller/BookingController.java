package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.dto.BreakDownData;
import com.servicemycar.booking.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @PostMapping(value = "/appointments")
    public ResponseEntity<Response<?>> bookService(){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointment booked successfully", null));
    }


    @GetMapping(value = "/appointments")
    public ResponseEntity<Response<?>> getAllBookings(){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointments List Fetched successfully", new ArrayList<>()));
    }


    @PutMapping(value = "/appointments/{appointmentId}")
    public ResponseEntity<Response<?>> updateBookings(@PathVariable("id") String appointmentId){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointment updated successfully", null));
    }


    @DeleteMapping(value = "/appointments/{appointmentId}")
    public ResponseEntity<Response<?>> cancelBooking(@PathVariable("id") String appointmentId){
        return ResponseEntity.ok(new Response<>("1200", "Service Appointment updated successfully",null));
    }


    @PostMapping(value = "/breakdown-notification")
    public ResponseEntity<Response<?>> notifyBreakDown(@RequestBody BreakDownData breakDownData){
        return ResponseEntity.ok(new Response<>("1200", bookingService.sendBreakDownAlert(breakDownData), "Success"));
    }

}
