package com.example.cinema.utils;

public class Generator {
    public static int generateInt(int min , int max) {
       return Math.abs(min + (int)(Math.random() * ((max - min) + 1)));
    }
}
