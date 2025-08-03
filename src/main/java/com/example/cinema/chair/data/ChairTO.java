package com.example.cinema.chair.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.hall.data.HallTO;
import com.example.cinema.ticket.data.TicketTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "chairs")
@SequenceGenerator(name = "seq_chairs", sequenceName = "seq_chairs")
public class ChairTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_chairs")
    @Column(name = "chair_id")
    private Long chairId;

    @Column(nullable = false , name = "chair_number")
    private Integer chairNumber;

    @Column(nullable = false)
    private Integer rowNumber;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "hall_id" , nullable = false)
    private HallTO hall;

    @OneToMany(fetch = FetchType.LAZY , mappedBy = "chair")
    private List<TicketTO> tickets = new ArrayList<>();

    public Long getChairId() {
        return chairId;
    }

    public void setChairId(Long chairId) {
        this.chairId = chairId;
    }

    public Integer getChairNumber() {
        return chairNumber;
    }

    public void setChairNumber(Integer chairNumber) {
        this.chairNumber = chairNumber;
    }

    public Integer getRowNumber() {
        return rowNumber;
    }

    public void setRowNumber(Integer rowNumber) {
        this.rowNumber = rowNumber;
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
}
