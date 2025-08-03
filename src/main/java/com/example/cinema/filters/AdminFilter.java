package com.example.cinema.filters;


import com.example.cinema.authorize.AuthorizeUtil;
import com.example.cinema.permission.data.Permission;
import com.example.cinema.role.data.Role;
import com.example.cinema.user.data.UserTO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;

@WebFilter(urlPatterns = {"/admin/*", "/admin"})
public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        UserTO user = ((UserTO) req.getSession().getAttribute("user"));
        List<Map<String, Object>> listOfPermission;
        if (user == null || user.getRole().getRole().equals(Role.USER)) {
            servletRequest.getRequestDispatcher("/").forward(req, res);
            return;
        }
        try {
            listOfPermission = AuthorizeUtil.authorize();
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }

        for (Map<String, Object> stringObjectMap : listOfPermission) {
            if (req.getRequestURI().contains(stringObjectMap.get("path").toString())) {
                if (((UserTO)req.getSession().getAttribute("user")).getPermission() == null) {
                    throw new RemoteException("UnAuthorized exception! 403");
                }
                else if (!stringObjectMap.get("permission").equals(((UserTO) req.getSession().getAttribute("user")).getPermission().getPermission())) {
                    throw new RemoteException("UnAuthorized exception! 403");
                }
            }
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
    }
}
