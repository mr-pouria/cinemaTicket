package com.example.cinema.authentication.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserCodesDTO {
    private List<Map<String, Object>> requestParams = new ArrayList<>();

    public List<Map<String, Object>> getRequestParams() {
        return requestParams;
    }

    public void setRequestParams(List<Map<String, Object>> requestParams) {
        this.requestParams = requestParams;
    }
}
