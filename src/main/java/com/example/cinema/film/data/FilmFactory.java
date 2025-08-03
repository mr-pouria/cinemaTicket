package com.example.cinema.film.data;

import com.example.cinema.hibernate.HibernateBaseFactory;

public class FilmFactory extends HibernateBaseFactory<FilmTO, Long> {
    public FilmFactory() {
        super(FilmTO.class);
    }
}
