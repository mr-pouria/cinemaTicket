package com.example.cinema;

import com.example.cinema.hibernate.HibernateBaseFactory;
import com.example.cinema.utils.ContextHolder;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class StartUpListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        HibernateBaseFactory.buildSessionFactory();
        ContextHolder.getInstance().setContextPath(sce.getServletContext());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        HibernateBaseFactory.shutdown();
    }

}
