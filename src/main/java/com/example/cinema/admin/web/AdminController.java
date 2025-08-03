package com.example.cinema.admin.web;

import com.example.cinema.film.biz.FilmBizImpl;
import com.example.cinema.film.data.FilmTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(urlPatterns = {
        "/admin"
})
public class AdminController extends HttpServlet {

    private final FilmBizImpl filmBiz;

    public AdminController() {
        this.filmBiz = new FilmBizImpl();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<FilmTO> film = filmBiz.getAll();
        req.setAttribute("films", film.subList(0, Math.min(6, film.size())));
        req.getRequestDispatcher("/admin.jsp").forward(req, res);
    }

}
