package com.example.cinema.chair.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.chair.data.ChairFactory;
import com.example.cinema.chair.data.ChairTO;

import java.util.Collections;
import java.util.List;

public class ChairBizImpl implements ChairBiz {

    private final ChairFactory chairFactory;

    public ChairBizImpl() {
        chairFactory = new ChairFactory();
    }


    @Override
    public void create(BaseDTO dto) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public ChairTO get(Long chairId) {
        return null;
    }

    @Override
    public List<ChairTO> getAll() {
        return Collections.emptyList();
    }
}
