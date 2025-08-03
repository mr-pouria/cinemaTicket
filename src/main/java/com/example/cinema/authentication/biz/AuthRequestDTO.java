package com.example.cinema.authentication.biz;

public class AuthRequestDTO {
    private String phoneNumber;
    private States currentState;
    private UserCodesDTO userCodesDTO;

    public UserCodesDTO getUserCodesDTO() {
        return userCodesDTO;
    }

    public void setUserCodesDTO(UserCodesDTO userCodesDTO) {
        this.userCodesDTO = userCodesDTO;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public States getCurrentState() {
        return currentState;
    }

    public void setCurrentState(States currentState) {
        this.currentState = currentState;
    }
}
