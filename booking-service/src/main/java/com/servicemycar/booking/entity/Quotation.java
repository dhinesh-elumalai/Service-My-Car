package com.servicemycar.booking.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "T_QUOTATION")
public class Quotation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "description")
    private String description;

    @Column(name = "LINE_ITEMS")
    private String lineItems;

    @Column(name = "SERVICE_CENTER_ID")
    private int serviceCenterId;

    @Column(name = "TOTAL_PRICE")
    private String totalPrice;

    @Column(name = "USER_ID")
    private int requestedUserId;

}
