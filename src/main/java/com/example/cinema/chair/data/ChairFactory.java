package com.example.cinema.chair.data;

import com.example.cinema.hibernate.HibernateBaseFactory;

public class ChairFactory extends HibernateBaseFactory<ChairTO , Long> {
    public ChairFactory(){
        super(ChairTO.class);
    }
}
