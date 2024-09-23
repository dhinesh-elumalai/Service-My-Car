package com.servicemycar.notification.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BreakDownAlert {

    private String email;
    private String name;
    private String location;
    private String carModel;
    private String mobile;
    private String locationLink;
    private double latitude;
    private double longitude;
    private List<String> recipients;
}
