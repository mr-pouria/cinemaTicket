package com.example.cinema.hall.data;

import com.example.cinema.hibernate.HibernateBaseFactory;

public class HallFactory extends HibernateBaseFactory<HallTO, Long> {
    public HallFactory() {
        super(HallTO.class);
    }
}
