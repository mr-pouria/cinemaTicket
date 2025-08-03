package com.example.cinema.hall.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.chair.data.ChairTO;
import com.example.cinema.cinema.data.CinemaTO;
import com.example.cinema.screening.data.ScreeningTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "halls")
@SequenceGenerator(name = "seq_halls", sequenceName = "seq_halls")
public class HallTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_halls")
    @Column(name = "hall_id")
    private Long hallId;

    @Column(name = "hall_name", nullable = false)
    private String hallName;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cinema_id", nullable = false)
    private CinemaTO cinema;


    @OneToMany(fetch = FetchType.LAZY , mappedBy = "hall" , cascade = CascadeType.ALL)
    private List<ChairTO> chairs = new ArrayList<>();


    @OneToMany(fetch = FetchType.LAZY , mappedBy = "hall" , cascade = CascadeType.ALL)
    private List<ScreeningTO> screening = new ArrayList<>();


    private Integer capacity = 100;

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public CinemaTO getCinema() {
        return cinema;
    }

    public void setCinema(CinemaTO cinema) {
        this.cinema = cinema;
    }

    public List<ChairTO> getChairs() {
        return chairs;
    }

    public void setChairs(List<ChairTO> chairs) {
        this.chairs = chairs;
    }

    public List<ScreeningTO> getScreening() {
        return screening;
    }

    public void setScreening(List<ScreeningTO> screening) {
        this.screening = screening;
    }



}
