package com.example.cinema.authentication.biz;

public interface AuthBiz{


    Object authenticate(String phoneNumber);

    Object register(RegisterDTO registerDTO);
    Boolean verify(String input , String code);
}
