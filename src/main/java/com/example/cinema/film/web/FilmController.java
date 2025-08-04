package com.example.cinema.film.web;


import com.example.cinema.authorize.Authorize;
import com.example.cinema.authorize.Condition;
import com.example.cinema.authorize.Secure;
import com.example.cinema.film.biz.FilmBizImpl;
import com.example.cinema.film.biz.FilmRequestMapper;
import com.example.cinema.permission.data.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {
        "/admin/films",
        "/admin/films/insert",
        "/admin/films/delete"
})
@Secure
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200,
        maxFileSize = 1024 * 1024 * 200,
        maxRequestSize = 1024 * 1024 * 500)
public class FilmController extends HttpServlet {


    private final FilmBizImpl filmBiz;

    public FilmController() {
        filmBiz = new FilmBizImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setAttribute("films", filmBiz.getAll());
        req.getRequestDispatcher("/admin.jsp").forward(req, res);
    }

    @Override
    @Authorize(conditions = {@Condition(path = "/films/insert", permission = Permission.MODIFY), @Condition(path = "/films/delete", permission = Permission.MODIFY)})
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path) {
            case "/admin/films/insert":
                FilmRequestMapper mapper = new FilmRequestMapper();
                filmBiz.create(mapper.map(req.getParameterMap(), req.getPart("poster")));
                res.sendRedirect("/admin/films");
                break;
            case "/admin/films/delete":
                filmBiz.delete(Long.parseLong(req.getParameter("filmId")));
                res.sendRedirect("/admin/films");
                break;
        }

    }

}
