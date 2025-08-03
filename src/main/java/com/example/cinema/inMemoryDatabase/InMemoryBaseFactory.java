package com.example.cinema.inMemoryDatabase;

import com.example.cinema.inMemoryDatabase.annotations.AutoIncrement;
import com.example.cinema.inMemoryDatabase.annotations.Id;
import com.example.cinema.inMemoryDatabase.annotations.Unique;
import com.example.cinema.baseFactory.BaseFactory;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

public class InMemoryBaseFactory<T, A extends BaseDB<T>, S> implements BaseFactory<T, S> {
    private final T t;
    private final List<T> list;


    private void prepare(T t) throws InvocationTargetException, IllegalAccessException {
        Class<?> clazz = t.getClass();
        Field[] fields = clazz.getDeclaredFields();
        Method[] methods = clazz.getDeclaredMethods();
        for (Field field : fields) {
            field.setAccessible(true);
            if (field.isAnnotationPresent(Unique.class)) {
                Unique unique = field.getAnnotation(Unique.class);
                if (unique.value()) {
                    for (Method method : methods) {
                        if (method.getName().equalsIgnoreCase("get" + field.getName())) {
                            Object value = method.invoke(t);
                            for (T item : list) {
                                if (method.invoke(item).equals(value)) {
                                    throw new RuntimeException("Duplicate field " + field.getName());
                                }
                            }
                        }
                    }
                }
            }
            if (field.isAnnotationPresent(AutoIncrement.class)) {
                AutoIncrement autoIncrement = field.getAnnotation(AutoIncrement.class);
                if (!(field.getType().getGenericSuperclass().equals(Number.class))) {
                    throw new RuntimeException("Field " + field.getName() + " is not numeric");
                } else {
                    if (!list.isEmpty()) {
                        T last = list.get(list.size() - 1);
                        for (Method method : methods) {
                            if (method.getName().equalsIgnoreCase("get" + field.getName())) {
                                Long generatedId = Long.parseLong(method.invoke(last).toString()) + autoIncrement.incrementBy();
                                field.set(t, generatedId);
                            }
                        }
                    } else {
                        field.set(t, autoIncrement.initialValue());
                    }
                }

            }
        }
    }

    private String findId() {
        Class<?> clazz = t.getClass();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(Id.class)) {
                return field.getName();
            } else {
                throw new RuntimeException("no identity field exist!");
            }
        }
        return null;
    }

    public InMemoryBaseFactory(T t, A a) {
        this.list = a.getList();
        this.t = t;
    }


    @Override
    public T save(T t) {
        try {
            prepare(t);
            list.add(t);
            return t;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean delete(T t) {
        try {
            list.remove(t);
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<T> getAll() {
        try {
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public T getById(S s) {
        try {
            for (T item : list) {
                Method[] methods = item.getClass().getDeclaredMethods();
                for (Method method : methods) {
                    if (method.getName().equalsIgnoreCase("get" + findId())) {
                        if (method.invoke(item).equals(s)) {
                            return item;
                        }
                    } else {
                        throw new RuntimeException("getter and setter of " + findId() + "not found!");
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}
