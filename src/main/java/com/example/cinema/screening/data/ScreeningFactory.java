package com.example.cinema.screening.data;

import com.example.cinema.hibernate.HibernateBaseFactory;

public class ScreeningFactory extends HibernateBaseFactory<ScreeningTO, Long> {
    public ScreeningFactory() {
        super(ScreeningTO.class);
    }
}
