package com.example.cinema.user.data;

import com.example.cinema.inMemoryDatabase.BaseDB;

import java.util.ArrayList;
import java.util.List;

public class UserDB implements BaseDB<UserTO> {
    private List<UserTO> list = new ArrayList<>();
    private volatile static UserDB INSTANCE = null;

    private UserDB() {
    }

    public static UserDB getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new UserDB();
        }
        return INSTANCE;
    }

    public List<UserTO> getList() {
        return list;
    }
}
