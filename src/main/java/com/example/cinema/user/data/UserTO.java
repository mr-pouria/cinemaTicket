package com.example.cinema.user.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.cinema.data.CinemaTO;
import com.example.cinema.cinemaModerator.data.CinemaModeratorTO;
import com.example.cinema.permission.data.PermissionTO;
import com.example.cinema.role.data.Role;
import com.example.cinema.role.data.RoleFactory;
import com.example.cinema.role.data.RoleTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "users")
@SequenceGenerator(name = "seq_users", sequenceName = "seq_users")
public class UserTO extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_users")
    @Column(name = "user_id")
    private Long userId;

    @Column(unique = true , name = "phone_numer")
    private String phoneNumber;

    @Column(name = "full_name")
    private String fullName;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id", nullable = false)
    private RoleTO role;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cinema_id")
    private CinemaTO cinema;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "permission_id")
    private PermissionTO permission;


    @OneToMany(fetch = FetchType.LAZY , mappedBy = "user")
    private List<CinemaModeratorTO> cinemaModerators = new ArrayList<>();



    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public RoleTO getRole() {
        return role;
    }

    public void setRole(RoleTO role) {
        this.role = role;
    }

    public PermissionTO getPermission() {
        return permission;
    }

    public void setPermission(PermissionTO permission) {
        this.permission = permission;
    }




    public UserTO() {
    }

    public UserTO(String userName, String fullName) {
        this.phoneNumber = userName;
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public Long getUserId() {
        return userId;
    }

    public String getFullName() {
        return fullName;
    }

    public CinemaTO getCinema() {
        return cinema;
    }

    public void setCinema(CinemaTO cinema) {
        this.cinema = cinema;
    }
}
