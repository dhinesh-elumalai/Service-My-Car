package com.servicemycar.user.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "T_USER")
@Builder
public class User extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID")
    private int userId;
    @Column(name = "USER_NAME", unique = true)
    private String username;
    @Column(name = "FIRST_NAME")
    private String firstName;
    @Column(name = "LAST_NAME")
    private String lastName;
    @Column(name = "EMAIL")
    private String email;
    @Column(name ="PHONE")
    private String phone;
    @Column(name ="ADDRESS")
    private String address;
    @Column(name ="adhaarNumber")
    private String adhaarNumber;
    @Column(name ="password")
    private String password;
    @Column(name ="ROLE")
    private String role;
    @Column(name ="STATUS")
    private String status;
    @Column(name ="IS_ACTIVE")
    private boolean isActive;

}
