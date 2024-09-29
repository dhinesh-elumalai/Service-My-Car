package com.servicemycar.booking.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuotationRequest {

    private String username;
    private String issue;
    private long lastServiceDate;
    private String city;
}
