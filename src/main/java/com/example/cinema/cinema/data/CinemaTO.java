package com.example.cinema.cinema.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.cinemaModerator.data.CinemaModeratorTO;
import com.example.cinema.hall.data.HallTO;
import com.example.cinema.user.data.UserTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cinemas")
@SequenceGenerator(name = "seq_cinemas", sequenceName = "seq_cinemas")
public class CinemaTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_cinemas")
    @Column(name = "cinema_id")
    private Long cinemaId;

    @Column(name = "cinema_name", nullable = false)
    private String cinemaName;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "cinema")
    private List<CinemaModeratorTO> cinemaModerators = new ArrayList<>();

    private String city;


    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "cinema_moderators" , joinColumns = @JoinColumn(name = "cinema_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<UserTO> moderators = new ArrayList<>();

    @OneToMany(mappedBy = "cinema", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<HallTO> halls = new ArrayList<>();

    public List<CinemaModeratorTO> getCinemaModerators() {
        return cinemaModerators;
    }

    public void setCinemaModerators(List<CinemaModeratorTO> cinemaModerators) {
        this.cinemaModerators = cinemaModerators;
    }



    private String address;

    private Float positionX;
    private Float positionY;

    public Long getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Long cinemaId) {
        this.cinemaId = cinemaId;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Float getPositionX() {
        return positionX;
    }

    public void setPositionX(Float positionX) {
        this.positionX = positionX;
    }

    public Float getPositionY() {
        return positionY;
    }

    public void setPositionY(Float positionY) {
        this.positionY = positionY;
    }

    public List<UserTO> getModerators() {
        return moderators;
    }

    public void setModerators(List<UserTO> moderators) {
        this.moderators = moderators;
    }

    public List<HallTO> getHalls() {
        return halls;
    }

    public void setHalls(List<HallTO> halls) {
        this.halls = halls;
    }




}
