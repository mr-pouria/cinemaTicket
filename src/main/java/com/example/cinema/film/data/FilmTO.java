package com.example.cinema.film.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.genre.data.GenreTO;
import com.example.cinema.screening.data.ScreeningTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "films")
@SequenceGenerator(name = "seq_films", sequenceName = "seq_films")
public class FilmTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_films")
    @Column(name = "film_id")
    private Long filmId;

    @Column(nullable = false , name = "film_name")
    private String filmName;

    private String author;

    private Short time;

    private String poster;

    private Short year;

    private String actors;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_id")
    private GenreTO genre;

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Short getTime() {
        return time;
    }

    public void setTime(Short time) {
        this.time = time;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Short getYear() {
        return year;
    }

    public void setYear(Short year) {
        this.year = year;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public GenreTO getGenre() {
        return genre;
    }

    public void setGenre(GenreTO genre) {
        this.genre = genre;
    }

    @OneToMany(fetch = FetchType.LAZY , mappedBy = "film" , cascade = CascadeType.ALL)
    private List<ScreeningTO> screenings = new ArrayList<>();

    public String getFilmName() {
        return filmName;
    }


    public Long getFilmId() {
        return filmId;
    }

    public void setFilmId(Long filmId) {
        this.filmId = filmId;
    }


    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public List<ScreeningTO> getScreenings() {
        return screenings;
    }

    public void setScreenings(List<ScreeningTO> screenings) {
        this.screenings = screenings;
    }



}
