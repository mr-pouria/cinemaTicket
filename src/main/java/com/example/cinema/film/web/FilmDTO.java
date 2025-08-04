package com.example.cinema.film.biz;

import com.example.cinema.BaseDTO;

import javax.servlet.http.Part;
import java.io.InputStream;

public class FilmDTO implements BaseDTO {
    private String filmName;
    private String author;
    private Short year;
    private String actors;
    private Short time;
    private Long filmId;
    private Part poster;

    public FilmDTO() {

    }

    public Long getFilmId() {
        return filmId;
    }

    public void setFilmId(Long filmId) {
        this.filmId = filmId;
    }




    public FilmDTO(String filmName, String author, Part poster, Short year, String actors, Short time, Long filmId) {
        this.filmName = filmName;
        this.author = author;
        this.poster = poster;
        this.year = year;
        this.actors = actors;
        this.time = time;
        this.filmId = filmId;
    }

    public Part getPoster() {
        return poster;
    }

    public void setPoster(Part poster) {
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

    public Short getTime() {
        return time;
    }

    public void setTime(Short time) {
        this.time = time;
    }


    public String getFilmName() {
        return filmName;
    }

    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
