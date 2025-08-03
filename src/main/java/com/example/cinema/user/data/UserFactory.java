package com.example.cinema.user.data;

import com.example.cinema.hibernate.HibernateBaseFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;


public class UserFactory extends HibernateBaseFactory<UserTO, Long> {

    public UserFactory() {
        super(UserTO.class);
    }

    public UserTO getUserByPhoneNumber(String phoneNumber) {
        try {

            Session session = getSession();
            String hql = "SELECT u FROM " + UserTO.class.getName() + " u WHERE u.phoneNumber = :phoneNumber";
            Query<UserTO> query = session.createQuery(hql, UserTO.class);
            query.setParameter("phoneNumber", phoneNumber);
            return query.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}
