package com.servicemycar.booking.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="T_APPOINTMENT")
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "USER_ID", nullable = false)
    private int userId;

    @Column(name = "SERVICE_CENTER_ID", nullable = false)
    private int serviceCenterId;

    @Column(name = "FROM_TIME")
    private long fromTime;

    @Column(name = "TO_TIME")
    private long toTime;

    @Column(name = "IS_CONFIRMED")
    private boolean isConfirmed;

    @Column(name = "IS_COMPLETED")
    private boolean isCompleted;
}
