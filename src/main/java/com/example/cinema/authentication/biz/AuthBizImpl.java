package com.example.cinema.authentication.biz;

import com.example.cinema.otp.SendMessageImpl;
import com.example.cinema.role.data.Role;
import com.example.cinema.role.data.RoleFactory;
import com.example.cinema.role.data.RoleTO;
import com.example.cinema.user.biz.UserNotFoundException;
import com.example.cinema.user.data.UserFactory;
import com.example.cinema.user.data.UserTO;
import com.example.cinema.utils.Generator;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;


public class AuthBizImpl implements AuthBiz {


    public void login(AuthRequestDTO authRequestDTO) {
        UserFactory userFactory = new UserFactory();
        UserTO user = userFactory.getUserByPhoneNumber(authRequestDTO.getPhoneNumber());
        if (user == null) {
            throw new UserNotFoundException("user not found!");
        }
    }

    public Map<String, Object> sendVCode(AuthRequestDTO authRequestDTO) {
        if (canSendCode(authRequestDTO)) {
            SendMessageImpl sendMessage = new SendMessageImpl();
            String code = String.valueOf(Generator.generateInt(10000, 99999));
            String text = "کد تایید سینماتیکت "
                    + code +
                    " این کد را در اختیار دیگران قرار ندهید!";
            sendMessage.send(authRequestDTO.getPhoneNumber(), text);
            Map<String, Object> map = new HashMap<>();
            map.put("vCode", code);
            map.put("vCodeExpireDate", LocalDateTime.now().plusSeconds(120));
            map.put("vCodePhoneNumber", authRequestDTO.getPhoneNumber());
            return map;
        } else {
            return null;
        }
    }

    public Boolean canSendCode(AuthRequestDTO authRequestDTO) {

        for (Map<String, Object> map : authRequestDTO.getUserCodesDTO().getRequestParams()) {
            if (map.isEmpty()) {
                continue;
            }
            LocalDateTime vCodeExpireDate = (LocalDateTime) map.get("vCodeExpireDate");
            String vCodePhoneNumber = map.get("vCodePhoneNumber").toString();
            boolean isExpire = vCodeExpireDate.isBefore(LocalDateTime.now());

            if (vCodePhoneNumber.equals(authRequestDTO.getPhoneNumber()) && isExpire) {

                return true;
            } else if (vCodePhoneNumber.equals(authRequestDTO.getPhoneNumber()) && !isExpire) {
                return false;
            }
        }
        return true;
    }

    public Boolean check(AuthRequestDTO authRequestDTO, String input) {
        for (Map<String, Object> requestParam : authRequestDTO.getUserCodesDTO().getRequestParams()) {
            if (requestParam.get("vCodePhoneNumber").equals(authRequestDTO.getPhoneNumber())) {
                LocalDateTime vCodeExpireDate = (LocalDateTime) requestParam.get("vCodeExpireDate");
                return true;
//                return verify(input, requestParam.get("vCode").toString()) && vCodeExpireDate.isAfter(LocalDateTime.now());
            }
        }
        return false;
    }


    @Override
    public Object authenticate(String phoneNumber) {
        UserFactory userFactory = new UserFactory();
        return userFactory.getUserByPhoneNumber(phoneNumber);
    }

    @Override
    public Object register(RegisterDTO dto) {
        UserTO user = new UserTO();
        RoleTO role = new RoleTO();
        role.setRole(Role.ADMIN);
        RoleFactory roleFactory = new RoleFactory();
        roleFactory.save(role);
        user.setFullName(dto.getFullName());
        user.setPhoneNumber(dto.getPhoneNumber());
        user.setRole(role);
        UserFactory userFactory = new UserFactory();
        userFactory.save(user);
        return user;
    }

    @Override
    public Boolean verify(String input, String code) {
        return input.equals(code);
    }
}
