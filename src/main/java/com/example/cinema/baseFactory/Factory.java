package com.example.cinema.baseFactory;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface Factory<T,S> {
    T save(T t) throws InvocationTargetException, IllegalAccessException;
    Boolean delete(T t) throws InvocationTargetException, IllegalAccessException;
    List<T> getAll() throws InvocationTargetException, IllegalAccessException;
    T getById(S s) throws InvocationTargetException, IllegalAccessException;
}
