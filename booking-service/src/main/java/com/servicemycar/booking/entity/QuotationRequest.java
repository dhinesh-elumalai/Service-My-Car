package com.servicemycar.booking.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "T_QUOTATION_REQUEST")
public class QuotationRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String issue;
    private String lastServiceDate;
    private String city;
    private String carModel;
    private String carBrand;
    private String carYear;
}
