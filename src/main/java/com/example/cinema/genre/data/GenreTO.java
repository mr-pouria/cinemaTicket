package com.example.cinema.genre.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.film.data.FilmTO;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "genres")
@SequenceGenerator(name = "seq_genres", sequenceName = "seq_genres")
public class GenreTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_genres")
    @Column(name = "genre_id")
    private Long genreId;

    @Column(name = "genre_name", nullable = false)
    private String genreName;


    @OneToMany(mappedBy = "genre")
    private List<FilmTO> films;


}
