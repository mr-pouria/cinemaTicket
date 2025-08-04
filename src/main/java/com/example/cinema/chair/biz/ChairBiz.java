package com.example.cinema.chair.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.chair.data.ChairTO;
import com.example.cinema.film.data.FilmTO;

import java.util.List;

public interface ChairBiz {

    void create(BaseDTO dto);
    void delete(Long id);
    ChairTO get(Long chairId);
    List<ChairTO> getAll();

}
