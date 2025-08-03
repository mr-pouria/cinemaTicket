package com.example.cinema.role.data;

import com.example.cinema.hibernate.HibernateBaseFactory;

import java.util.List;

public class RoleFactory extends HibernateBaseFactory<RoleTO , Long> {
    public RoleFactory() {
        super(RoleTO.class);
    }
}
