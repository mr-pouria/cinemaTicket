package com.example.cinema.screening.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.film.data.FilmTO;
import com.example.cinema.screening.data.ScreeningTO;

import java.util.List;

public interface ScreeningBiz {
    void create(BaseDTO dto);
    void delete(Long id);
    ScreeningTO get(Long screeningId);
    List<ScreeningTO> getAll();
}
