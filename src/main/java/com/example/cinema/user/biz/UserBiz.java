package com.example.cinema.user.biz;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface UserBiz {

    void login(LoginFormPojo loginFormPojo) throws ServletException, IOException;

}
