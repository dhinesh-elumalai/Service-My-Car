package com.servicemycar.booking.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "T_CAR")
public class CarData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "model")
    @JsonProperty("model")
    private String model;

    @Column(name = "brand")
    @JsonProperty("brand")
    private String brand;

    @Column(name = "manufacturing_year")
    @JsonProperty("year")
    private String year;

    @Column(name = "vehicle_number")
    @JsonProperty("vehicleNumber")
    private String vehicleNumber;

    @Column(name = "engine_number")
    @JsonProperty("engineNumber")
    private String engineNumber;

    @Column(name = "fuelType")
    @JsonProperty("fuelType")
    private String fuelType;

    @Column(name = "username")
    private String username;

}
