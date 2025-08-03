package com.example.cinema.ticket.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.chair.data.ChairTO;
import com.example.cinema.screening.data.ScreeningTO;
import com.example.cinema.user.data.UserTO;

import javax.persistence.*;

@Entity
@Table(name = "tickets")
@SequenceGenerator(name = "seq_tickets", sequenceName = "seq_tickets")
public class TicketTO extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tickets")
    @Column(name = "ticket_id")
    private Long ticketId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "screening_id", nullable = false)
    private ScreeningTO screening;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chair_id" , nullable = false)
    private ChairTO chair;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "generated_by")
    private UserTO user;

    public Long getTicketId() {
        return ticketId;
    }

    public void setTicketId(Long ticketId) {
        this.ticketId = ticketId;
    }

    public ScreeningTO getScreening() {
        return screening;
    }

    public void setScreening(ScreeningTO screening) {
        this.screening = screening;
    }

    public ChairTO getChair() {
        return chair;
    }

    public void setChair(ChairTO chair) {
        this.chair = chair;
    }

    public UserTO getUser() {
        return user;
    }

    public void setUser(UserTO user) {
        this.user = user;
    }
}
