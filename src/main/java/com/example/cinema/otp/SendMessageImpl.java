package com.example.cinema.otp;


import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.FileInputStream;;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
public class SendMessageImpl implements SendMessage {

    private final String KEY;
    private final String LINE;
    private final String USERNAME;

    public SendMessageImpl() {
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("application.properties")) {
            if (inputStream == null) {
                throw new RuntimeException("application.properties not found in classpath!");
            }

            Properties properties = new Properties();
            properties.load(inputStream);

            this.KEY = properties.getProperty("sms.ir.key");
            this.LINE = properties.getProperty("sms.ir.line");
            this.USERNAME = properties.getProperty("sms.ir.username");

            if (KEY == null || LINE == null || USERNAME == null) {
                throw new RuntimeException("Required properties are missing in application.properties!");
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to load application.properties", e);
        }
    }

    @Override
    public void send(String phoneNumber, String text) {

        try {

            String url = "https://api.sms.ir/v1/send?username=" + USERNAME + "&password=" + KEY + "&line=" + LINE + "&mobile=" + phoneNumber + "&text=" + text;
            OkHttpClient client = new OkHttpClient();
            Request request = new Request.Builder().url(url).build();
            Call call = client.newCall(request);
            Response response = call.execute();
            response.body();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
