package com.example.cinema.screening.web;

import com.example.cinema.screening.biz.ScreeningBizImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        urlPatterns = {
                "/admin/screening"
        }
)
public class ScreeningController extends HttpServlet {

    private final ScreeningBizImpl screeningBiz;

    public ScreeningController() {
        screeningBiz = new ScreeningBizImpl();
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path) {
            case "/admin/films":
                req.setAttribute("films", screeningBiz.getAll());
                break;
        }
        req.getRequestDispatcher("/admin.jsp").forward(req, res);
    }

}
