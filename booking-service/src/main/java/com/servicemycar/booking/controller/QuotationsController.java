package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.entity.Quotation;
import com.servicemycar.booking.service.QuotationService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class QuotationsController {

    @Autowired
    private QuotationService quotationService;

    @PostMapping(value ="/quotations/request")
    public ResponseEntity<Response<?>> requestQuotations(){
        return ResponseEntity.ok(new Response<>("1200", "Quotation requested successfully", null));
    }

    @GetMapping(value ="/quotations")
    public ResponseEntity<Response<List<Quotation>>> getAllQuotations(){
        return ResponseEntity.ok(new Response<List<Quotation>>("1200", "Quotations fetched successfully", quotationService.getAllQuotations()));
    }

    @PostMapping(value ="/quotations")
    public ResponseEntity<Response<?>> submitQuotation(@RequestBody Quotation quotation){
        return ResponseEntity.ok(new Response<>("1200", "Quotation submitted successfully", quotationService.createQuotation(quotation)));
    }

    @GetMapping(value ="/quotations/{id}")
    public ResponseEntity<Response<?>> getQuotationById(@PathVariable("id") long id){
        return ResponseEntity.ok(new Response<>("1200", "Quotation fetched successfully", quotationService.getQuotationById(id)));
    }

    @DeleteMapping(value ="/quotations/{id}")
    public ResponseEntity<Response<?>> deleteQuotation(@PathVariable("id") long id){
        return ResponseEntity.ok(new Response<>("1200", "Quotation deleted successfully", quotationService.deleteQuotationById(id)));
    }
}
