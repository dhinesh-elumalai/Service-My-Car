package com.servicemycar.booking.controller;

import com.servicemycar.booking.common.Response;
import com.servicemycar.booking.entity.QuotationRequest;
import com.servicemycar.booking.entity.Quotation;
import com.servicemycar.booking.service.QuotationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
public class QuotationsController {

    @Autowired
    private QuotationService quotationService;

    @PostMapping(value = "/quotations/request")
    public ResponseEntity<Response<?>> requestQuotations(@RequestBody QuotationRequest quotationRequest) {

        return ResponseEntity.ok(new Response<>("1200", "Quotation requested successfully",
                quotationService.requestQuotation(quotationRequest)));
    }

    @GetMapping(value = "/quotations")
    public ResponseEntity<Response<List<Quotation>>> getAllQuotations() {
        return ResponseEntity.ok(new Response<>("1200", "Quotations fetched successfully",
                quotationService.getAllQuotations()));
    }


    @GetMapping(value = "/quotation-requests")
    public ResponseEntity<Response<List<QuotationRequest>>> getAllQuotationRequests() {
        return ResponseEntity.ok(new Response<>("1200", "Quotation Requests fetched successfully",
                quotationService.getAllQuoteRequests()));
    }

    @PostMapping(value = "/quotations")
    public ResponseEntity<Response<Quotation>> submitQuotation(@RequestBody Quotation quotation) {
        return ResponseEntity.ok(new Response<>("1200", "Quotation submitted successfully",
                quotationService.createQuotation(quotation)));
    }

    @GetMapping(value = "/quotations/{id}")
    public ResponseEntity<Response<Quotation>> getQuotationById(@PathVariable("id") long id) {
        return ResponseEntity.ok(new Response<>("1200", "Quotation fetched successfully",
                quotationService.getQuotationById(id)));
    }

    @GetMapping(value = "/users/quotations/{username}")
    public ResponseEntity<Response<List<Quotation>>> getQuotationsByUsername(@PathVariable("username") String username) {
        return ResponseEntity.ok(new Response<>("1200", "Quotation fetched successfully",
                quotationService.getQuotationByUsername(username)));
    }

    @DeleteMapping(value = "/quotations/{id}")
    public ResponseEntity<Response<String>> deleteQuotation(@PathVariable("id") long id) {
        return ResponseEntity.ok(new Response<>("1200", "Quotation deleted successfully",
                quotationService.deleteQuotationById(id)));
    }
}
