package com.example.cinema.cinemaModerator.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.cinema.data.CinemaTO;
import com.example.cinema.user.data.UserTO;

import javax.persistence.*;

@Entity
@Table(name = "cinema_moderators")
@SequenceGenerator(name = "seq_cinema_moderators", sequenceName = "seq_cinema_moderators")
public class CinemaModeratorTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_cinema_moderators")
    @Column(name = "cinema_moderator_id")
    private Long cinemaModeratorId;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id" , nullable = false)
    private UserTO user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cinema_id" , nullable = false)
    private CinemaTO cinema;

    public Long getCinemaModeratorId() {
        return cinemaModeratorId;
    }

    public void setCinemaModeratorId(Long cinemaModeratorId) {
        this.cinemaModeratorId = cinemaModeratorId;
    }

    public UserTO getUser() {
        return user;
    }

    public void setUser(UserTO user) {
        this.user = user;
    }

    public CinemaTO getCinema() {
        return cinema;
    }

    public void setCinema(CinemaTO cinema) {
        this.cinema = cinema;
    }
}
