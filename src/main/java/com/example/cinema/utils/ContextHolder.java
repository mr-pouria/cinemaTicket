package com.example.cinema.utils;

import javax.servlet.ServletContext;

public class ContextHolder {

    private ServletContext servletContext;

    private static ContextHolder instance = null;

    private ContextHolder() {
    }

    public static ContextHolder getInstance() {
        if (instance == null) {
            instance = new ContextHolder();
        }
        return instance;
    }

    public void setContextPath(ServletContext servletContext) {
        if (this.servletContext == null) {
            this.servletContext = servletContext;
        }
    }


    public String getContextPath() {
        return servletContext.getRealPath("");
    }
}
