package com.servicemycar.user.entity;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseEntity {

    @Column(name = "created_time")
    private String createdTime;
    @Column(name = "created_by")
    private String createdBy;
    @Column(name = "updated_time")
    private String updatedTime;
    @Column(name = "updated_by")
    private String updatedBy;
}
