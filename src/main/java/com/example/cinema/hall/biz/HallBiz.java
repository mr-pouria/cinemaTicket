package com.example.cinema.hall.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.film.data.FilmTO;
import com.example.cinema.hall.data.HallTO;

import java.util.List;

public interface HallBiz {
    void create(BaseDTO dto);
    void delete(Long id);
    HallTO get(Long hallId);
    List<HallTO> getAll();
}
