package com.example.cinema.hall.web;


import com.example.cinema.authorize.Authorize;
import com.example.cinema.authorize.Condition;
import com.example.cinema.authorize.Secure;
import com.example.cinema.hall.biz.HallBizImpl;
import com.example.cinema.hall.biz.HallRequestMapper;
import com.example.cinema.permission.data.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {
        "/admin/halls",
        "/admin/halls/insert",
        "/admin/halls/delete"
})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200,
        maxFileSize = 1024 * 1024 * 200,
        maxRequestSize = 1024 * 1024 * 500)
@Secure
public class HallController extends HttpServlet {


    private final HallBizImpl hallBiz;


    public HallController() {
        hallBiz = new HallBizImpl();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/admin/halls")) {
            req.setAttribute("halls", hallBiz.getAll());
            req.getRequestDispatcher("/admin.jsp").forward(req, res);
        }

    }

    @Override
    @Authorize(conditions = {@Condition(path = "/admin/halls/insert", permission = Permission.MODIFY), @Condition(path = "/admin/halls/delete", permission = Permission.MODIFY)})
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String path = req.getServletPath();
        switch (path) {
            case "/admin/halls/insert":
                HallRequestMapper hallRequestMapper = new HallRequestMapper();
                hallBiz.create(hallRequestMapper.map(req.getParameterMap()));
                res.sendRedirect("/admin/halls");
                break;
            case "/admin/halls/delete":
                hallBiz.delete(Long.parseLong(req.getParameter("hallId")));
                res.sendRedirect("/admin/halls");
                break;
        }


    }
}
