package com.example.cinema.film.biz;

import com.example.cinema.BaseDTO;
import com.example.cinema.film.data.FilmFactory;
import com.example.cinema.film.data.FilmTO;
import com.example.cinema.utils.ContextHolder;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

public class FilmBizImpl implements FilmBiz {

    private final FilmFactory filmFactory;

    public FilmBizImpl() {
        this.filmFactory = new FilmFactory();
    }


    @Override
    public void create(BaseDTO filmDTO) {
        try {
            FilmDTO dto = (FilmDTO) filmDTO;

            String posterPath = null;
            if (dto.getPoster() != null) {
                String uploadPath = ContextHolder.getInstance().getContextPath() + "/uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String fileName = System.currentTimeMillis() + "." + dto.getPoster().getSubmittedFileName().split("\\.")[1];
                try (InputStream fis = dto.getPoster().getInputStream()) {
                    Files.copy(fis, Paths.get(uploadPath, fileName));
                }
                posterPath = "uploads/" + fileName;
            }
            FilmTO filmTO = new FilmTO();
            filmTO.setFilmName(dto.getFilmName());
            filmTO.setAuthor(dto.getAuthor());
            filmTO.setActors(dto.getActors());
            filmTO.setTime(dto.getTime());
            filmTO.setYear(dto.getYear());
            filmTO.setPoster(posterPath);
            if (dto.getFilmId() != null) {
                filmTO.setFilmId(Long.parseLong(dto.getFilmId().toString()));
            }
            filmFactory.save(filmTO);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void delete(Long id) {
        filmFactory.delete(get(id));
    }

    @Override
    public FilmTO get(Long filmId) {
        return filmFactory.getById(filmId);
    }

    @Override
    public List<FilmTO> getAll() {
        return filmFactory.getAll();
    }
}
