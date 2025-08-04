package com.example.cinema.hall.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.chair.biz.ChairDTO;

import java.util.List;

public class HallDTO implements BaseDTO {

    private Long hallId;
    private String hallName;
    private Short maxRow;
    private Short eachRow;
    private String hallDescription;
    private List<ChairDTO> chairs;

    public List<ChairDTO> getChairs() {
        return chairs;
    }

    public void setChairs(List<ChairDTO> chairs) {
        this.chairs = chairs;
    }

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

    public Short getMaxRow() {
        return maxRow;
    }

    public void setMaxRow(Short maxRow) {
        this.maxRow = maxRow;
    }

    public Short getEachRow() {
        return eachRow;
    }

    public void setEachRow(Short eachRow) {
        this.eachRow = eachRow;
    }

    public String getHallDescription() {
        return hallDescription;
    }

    public void setHallDescription(String hallDescription) {
        this.hallDescription = hallDescription;
    }
}
