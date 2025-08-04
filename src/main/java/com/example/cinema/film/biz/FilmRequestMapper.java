package com.example.cinema.film.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.RequestMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class FilmRequestMapper implements RequestMapper {
    @Override
    public FilmDTO map(Map<String, String[]> params, Part part) {
        FilmDTO filmDTO = new FilmDTO();
        filmDTO.setFilmName(params.get("filmName")[0]);
        filmDTO.setAuthor(params.get("author")[0]);
        filmDTO.setTime(Short.valueOf(params.get("time")[0]));
        filmDTO.setYear(Short.valueOf(params.get("year")[0]));
        if (params.get("filmId") != null) {
            filmDTO.setFilmId(Long.valueOf(params.get("filmId")[0]));
        }
        if (part.getSize() > 0) {
            filmDTO.setPoster(part);
        }
        return filmDTO;
    }

    @Override
    public BaseDTO map(Map<String, String[]> params) {
        return null;
    }
}
