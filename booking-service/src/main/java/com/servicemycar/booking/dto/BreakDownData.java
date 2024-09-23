package com.servicemycar.booking.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BreakDownData {

    private String username;
    private String locationLink;
    private double latitude;
    private double longitude;

}
