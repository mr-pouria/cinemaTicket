package com.example.cinema.user.biz;

import com.example.cinema.otp.SendMessageImpl;
import com.example.cinema.user.data.UserFactory;
import com.example.cinema.user.data.UserTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;

public class UserBizImpl implements UserBiz {


    public int verify(AuthFormPojo authFormPojo) throws IOException {
        int code = Math.abs(10000 + (int)(Math.random() * ((99999 - 10000) + 1)));
        SendMessageImpl sendMessage = new SendMessageImpl();
        String text = "کد تایید سینماتیکت "
                 + code +
                " این کد را در اختیار دیگران قرار ندهید!";
//        sendMessage.send(authFormPojo.getPhoneNumber() , text);
        return code;
    }

    public void check() {

    }



    @Override
    public void login(LoginFormPojo loginFormPojo) throws ServletException, IOException {
        UserFactory userFactory = new UserFactory();
        UserTO user = userFactory.getUserByPhoneNumber(loginFormPojo.getPhoneNumber());
        if (user == null) {
            throw new UserNotFoundException("User not found!");
        }
    }

}
