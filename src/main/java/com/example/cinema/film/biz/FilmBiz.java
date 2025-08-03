package com.example.cinema.film.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.film.data.FilmTO;

import java.util.List;

public interface FilmBiz {
    void create(BaseDTO dto);
    void delete(Long id);
    FilmTO get(Long filmId);
    List<FilmTO> getAll();
}
