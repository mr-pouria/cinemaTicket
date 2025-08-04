package com.example.cinema.hibernate;

import com.example.cinema.baseFactory.BaseFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import java.util.List;

public class HibernateBaseFactory<T, S extends Number> implements BaseFactory<T, S> {

    private static StandardServiceRegistry registry;
    private static volatile SessionFactory sessionFactory;
    private final Class<T> t;
    private final static Object lock = new Object();

    public HibernateBaseFactory(Class<T> t) {
        this.t = t;
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void buildSessionFactory() {
        if (sessionFactory == null) {
            synchronized (lock) {
                if (sessionFactory == null) {
                    try {
                        registry = new StandardServiceRegistryBuilder()
                                .configure("hibernate.cfg.xml")
                                .build();
                        Metadata metadata = new MetadataSources(registry).getMetadataBuilder().build();
                        sessionFactory = metadata.getSessionFactoryBuilder().build();
                    } catch (Exception e) {
                        shutdown();
                        throw new RuntimeException(e);
                    }
                }
            }
        }
    }

    public static Session getSession() {
        return getSessionFactory().openSession();
    }

    public static void shutdown() {
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }

    @Override
    public T save(T t) {
        try (Session session = getSession()) {
            Transaction transaction = session.beginTransaction();
            session.saveOrUpdate(t);
            transaction.commit();
            return t;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shutdown();
        }
    }


    public void saveAll(List<T> list) {
        try (Session session = getSession()) {
            Transaction transaction = session.beginTransaction();
            list.forEach(session::saveOrUpdate);
            transaction.commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shutdown();
        }
    }


    @Override
    public Boolean delete(T t) {
        try (Session session = getSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(t);
            transaction.commit();
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shutdown();
        }
    }

    @Override
    public List<T> getAll() {
        try (Session session = getSession()) {
            String hql = "select t from " + t.getName() + " t";
            Query<T> query = session.createQuery(hql, t);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shutdown();
        }

    }

    @Override
    public T getById(S s) {
        try (Session session = getSession()) {
            return session.get(t, s);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shutdown();
        }
    }


}
