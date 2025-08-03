package com.example.cinema.authentication.web;


import com.example.cinema.authentication.biz.*;
import com.example.cinema.user.biz.UserNotFoundException;
import com.example.cinema.user.data.UserTO;
import org.hibernate.annotations.Filter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = "/auth")
public class AuthController extends HttpServlet {

    private AuthBizImpl authBiz;

    @Override
    public void init() {
        authBiz = new AuthBizImpl();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getSession().setAttribute("state", States.INITIAL_AUTH_REQUEST);
        req.getRequestDispatcher("auth.jsp").forward(req, res);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getParameterMap();
        AuthRequestDTO authRequestDTO = new AuthRequestDTO();
        UserCodesDTO userCodesDTO = new UserCodesDTO();
        List<Map<String, Object>> list = req.getSession().getAttribute("verificationMapList") == null ? new ArrayList<>() : (List<Map<String, Object>>) req.getSession().getAttribute("verificationMapList");
        userCodesDTO.setRequestParams(list);
        authRequestDTO.setUserCodesDTO(userCodesDTO);
        try {
            States state = (States) req.getSession().getAttribute("state");
            switch (state) {
                case INITIAL_AUTH_REQUEST:
                    req.getSession().setAttribute("phoneNumber", req.getParameter("phoneNumber"));
                    authRequestDTO.setPhoneNumber(req.getParameter("phoneNumber"));
                    authBiz.login(authRequestDTO);
                    Map<String, Object> map = authBiz.sendVCode(authRequestDTO);
                    if (map != null) {
                        list = list.stream().filter(stringObjectMap -> !stringObjectMap.get("vCodePhoneNumber").equals(map.get("vCodePhoneNumber"))).collect(Collectors.toList());
                        list.add(map);
                        req.getSession().setAttribute("verificationMapList", list);
                    } else {
                        req.setAttribute("errorMsg", "کد تایید از قبل برای این شماره ارسال شده ، لطفا پس از دو دقیقه دوباره تلاش کنید!");
                    }
                    req.setAttribute("phoneNumber", authRequestDTO.getPhoneNumber());
                    req.getSession().setAttribute("state", States.VERIFY_TO_LOGIN);
                    req.getRequestDispatcher("auth.jsp").forward(req, res);
                    break;
                case VERIFY_TO_REGISTER:
                case VERIFY_TO_LOGIN:

                    authRequestDTO.setPhoneNumber(req.getSession().getAttribute("phoneNumber").toString());
                    if (!req.getParameter("code").isEmpty() && authBiz.check(authRequestDTO, req.getParameter("code"))) {
                        if (state.equals(States.VERIFY_TO_LOGIN)) {
                            UserTO user = (UserTO) authBiz.authenticate(req.getSession().getAttribute("phoneNumber").toString());
                            req.getSession().setAttribute("user", user);
                            res.sendRedirect("/");
                            return;
                        }
                        req.getSession().setAttribute("verifiedPhoneNumber", req.getSession().getAttribute("phoneNumber"));
                        req.getSession().setAttribute("state", States.REGISTER);
                        req.getRequestDispatcher("auth.jsp").forward(req, res);
                    } else {
                        req.setAttribute("phoneNumber", authRequestDTO.getPhoneNumber());
                        req.setAttribute("errorMsg", "کد تایید نامعتبر است!");
                    }
                    break;

                case REGISTER:
                    if (!req.getSession().getAttribute("verifiedPhoneNumber").equals(req.getSession().getAttribute("phoneNumber"))) {
                        req.getSession().setAttribute("state", States.INITIAL_AUTH_REQUEST);
                        req.setAttribute("errorMsg", "خطا در احراز هویت");
                        req.getRequestDispatcher("auth.jsp").forward(req, res);
                        break;
                    }
                    RegisterDTO registerDTO = new RegisterDTO();
                    registerDTO.setPhoneNumber(req.getSession().getAttribute("phoneNumber").toString());
                    registerDTO.setFullName(req.getParameter("fullName"));
                    UserTO user = (UserTO) authBiz.register(registerDTO);
                    req.getSession().setAttribute("user", user);
                    res.sendRedirect("/");
                    return;
                default:
                    break;

            }

        } catch (UserNotFoundException e) {
            Map<String, Object> map = authBiz.sendVCode(authRequestDTO);
            if (map != null) {
                list = list.stream().filter(stringObjectMap -> !stringObjectMap.get("vCodePhoneNumber").equals(map.get("vCodePhoneNumber"))).collect(Collectors.toList());
                list.add(map);
                req.getSession().setAttribute("verificationMapList", list);
            } else {
                req.setAttribute("errorMsg", "کد تایید از قبل برای این شماره ارسال شده ، لطفا پس از دو دقیقه دوباره تلاش کنید!");
            }
            req.setAttribute("phoneNumber", authRequestDTO.getPhoneNumber());
            req.getSession().setAttribute("state", States.VERIFY_TO_REGISTER);
        }
        req.getRequestDispatcher("auth.jsp").forward(req, res);


    }
}
