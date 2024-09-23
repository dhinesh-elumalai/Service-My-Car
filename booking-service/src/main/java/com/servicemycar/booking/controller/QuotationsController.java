package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuotationsController {

    @PostMapping(value ="/quotations/request")
    public ResponseEntity<Response<?>> requestQuotations(){
        return ResponseEntity.ok(new Response<>("1200", "Quotation requested successfully", null));
    }

    @GetMapping(value ="/quotations")
    public ResponseEntity<Response<?>> getAllQuotations(){
        return ResponseEntity.ok(new Response<>("1200", "Quotation fetched successfully", new ArrayList<>()));
    }

    @PostMapping(value ="/quotations")
    public ResponseEntity<Response<?>> submitQuotation(){
        return ResponseEntity.ok(new Response<>("1200", "Quotation submitted successfully", null));
    }

    @DeleteMapping(value ="/quotations")
    public ResponseEntity<Response<?>> deleteQuotation(){
        return ResponseEntity.ok(new Response<>("1200", "Quotation deleted successfully", null));
    }
}
