package com.example.cinema.inMemoryDatabase;

import java.util.List;

public interface BaseDB<T> {
    List<T> getList();
}
