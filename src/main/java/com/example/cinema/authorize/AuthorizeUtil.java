package com.example.cinema.authorize;

import io.github.classgraph.ClassGraph;
import io.github.classgraph.ScanResult;

import java.lang.reflect.Method;
import java.util.*;

public class AuthorizeUtil {

    public static List<Map<String, Object>> authorize() throws NoSuchMethodException {
        List<Map<String, Object>> mapList = new ArrayList<>();

        List<Class<?>> classes = new ArrayList<>();

        try (ScanResult scanResult = new ClassGraph()
                .enableAllInfo()
                .acceptPackages("com.example.cinema")
                .scan()) {

            scanResult.getAllClasses()
                    .forEach(classInfo -> {
                        try {
                            classes.add(classInfo.loadClass());
                        } catch (Exception e) {
                            System.err.println("Error loading class: " + classInfo.getName());
                        }
                    });
        }

        for (Class<?> clazz : classes) {
            if (clazz.isAnnotationPresent(Secure.class)) {
                Method[] methods = clazz.getDeclaredMethods();
                for (Method method : methods) {
                    if (method.isAnnotationPresent(Authorize.class)) {
                        Authorize authorize = method.getAnnotation(Authorize.class);
                        for (Condition con : authorize.conditions()) {
                            Map<String, Object> map = new HashMap<>();
                            map.put("path", con.path());
                            map.put("permission", con.permission());
                            mapList.add(map);
                        }
                    }
                }
            }
        }
        return mapList;
    }
}
