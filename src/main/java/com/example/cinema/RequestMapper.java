package com.example.cinema;


import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public interface RequestMapper {
    BaseDTO map(Map<String , String[]> params , Part part) throws IOException;
}
