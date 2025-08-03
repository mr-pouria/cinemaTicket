package com.example.cinema.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/auth")
public class AuthFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) {
    }


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;


        if (req.getSession().getAttribute("user") != null) {
            servletRequest.getRequestDispatcher("/").forward(req , res);
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);


    }

    @Override
    public void destroy() {
    }
}
