package com.example.cinema.screening.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.chair.data.ChairTO;
import com.example.cinema.film.data.FilmTO;
import com.example.cinema.hall.data.HallTO;
import com.example.cinema.ticket.data.TicketTO;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "screenings")
@SequenceGenerator(name = "seq_screenings", sequenceName = "seq_screenings")
public class ScreeningTO extends BaseEntity {

    @Id
    @GeneratedValue(generator = "seq_screenings", strategy = GenerationType.SEQUENCE)
    @Column(name = "screening_id")
    private Long screeningId;


    @Column(nullable = false , name = "start_date")
    private LocalDateTime startDateTime;

    @Column(nullable = false , name = "max_time")
    private Integer maxTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "hall_id")
    private HallTO hall;

    @OneToMany(fetch = FetchType.LAZY , mappedBy = "screening")
    private List<TicketTO> tickets = new ArrayList<>();


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "film_id", nullable = false)
    private FilmTO film;


    public LocalDateTime getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(LocalDateTime startDateTime) {
        this.startDateTime = startDateTime;
    }

    public Long getScreeningId() {
        return screeningId;
    }

    public void setScreeningId(Long screeningId) {
        this.screeningId = screeningId;
    }

    public Integer getMaxTime() {
        return maxTime;
    }

    public void setMaxTime(Integer maxTime) {
        this.maxTime = maxTime;
    }

    public HallTO getHall() {
        return hall;
    }

    public void setHall(HallTO hall) {
        this.hall = hall;
    }

    public List<TicketTO> getTickets() {
        return tickets;
    }

    public void setTickets(List<TicketTO> tickets) {
        this.tickets = tickets;
    }

    public FilmTO getFilm() {
        return film;
    }

    public void setFilm(FilmTO film) {
        this.film = film;
    }

}
