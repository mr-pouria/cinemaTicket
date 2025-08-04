package com.example.cinema.chair.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.hall.data.HallTO;

public class ChairDTO implements BaseDTO {
    private Long chairId;
    private Integer chairNumber;
    private Integer rowNumber;
    private Long hallId;

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

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }
}
