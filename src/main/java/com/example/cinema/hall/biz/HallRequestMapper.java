package com.example.cinema.hall.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.RequestMapper;
import com.example.cinema.film.biz.FilmDTO;
import com.example.cinema.hall.data.HallTO;

import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Map;

public class HallRequestMapper implements RequestMapper {
    @Override
    public BaseDTO map(Map<String, String[]> params, Part part) throws IOException {
        return null;
    }

    @Override
    public  HallDTO map(Map<String, String[]> params) {
        HallDTO hallDTO = new HallDTO();
        hallDTO.setHallName(params.get("hallName")[0]);
        hallDTO.setHallDescription(params.get("hallDescription")[0]);
        hallDTO.setEachRow(Short.valueOf(params.get("eachRow")[0]));
        hallDTO.setMaxRow(Short.valueOf(params.get("maxRow")[0]));
        if (params.get("chairs") != null) {
        }
        if (params.get("hallId") != null) {
            hallDTO.setHallId(Long.valueOf(params.get("hallId")[0]));
        }
        return hallDTO;
    }
}
