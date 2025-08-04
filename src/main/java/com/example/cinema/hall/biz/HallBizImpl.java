package com.example.cinema.hall.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.chair.data.ChairFactory;
import com.example.cinema.chair.data.ChairTO;
import com.example.cinema.hall.data.HallFactory;
import com.example.cinema.hall.data.HallTO;

import java.util.ArrayList;
import java.util.List;

public class HallBizImpl implements HallBiz {

    private final HallFactory hallFactory;
    private final ChairFactory chairFactory;

    public HallBizImpl() {
        hallFactory = new HallFactory();
        chairFactory = new ChairFactory();
    }


    @Override
    public void create(BaseDTO hallDTO) {
        try {
            HallDTO dto = (HallDTO) hallDTO;
            List<ChairTO> chairs = new ArrayList<>();
            HallTO hallTO = new HallTO();
            hallTO.setHallName(dto.getHallName());
            hallTO.setDescription(dto.getHallDescription());
            hallTO.setMaxRow(dto.getMaxRow());
            hallTO.setEachRow(dto.getEachRow());

            if (dto.getHallId() != null) {
                hallTO.setHallId(dto.getHallId());
            }
            hallFactory.save(hallTO);
            chairFactory.saveAll(chairs);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void delete(Long id) {
        hallFactory.delete(get(id));
    }

    @Override
    public HallTO get(Long hallId) {
        return hallFactory.getById(hallId);
    }

    @Override
    public List<HallTO> getAll() {
        return hallFactory.getAll();
    }
}
