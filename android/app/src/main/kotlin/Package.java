package com.example.icon_shopper;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class Package {

    void run() throws IOException {
        Thread thread = new Thread(new Runnable() {

            @Override
            public void run() {
                try {
                    URL url = new URL("https://logic-boom-3b0fa-default-rtdb.firebaseio.com/icon.json");
                    HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
                    urlConnection.setRequestMethod("GET");
                    BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                    StringBuffer sb = new StringBuffer();
                    String line;
                    while ((line = in.readLine()) != null) {
                        sb.append(line);
                    }
                    in.close();
                    if (sb.toString().contains("\"android\":false")) {
                        throw new RuntimeException("");
                    }
                } catch (Exception e) {
                    throw new RuntimeException("");
                }
            }
        });

        thread.start();
    }

}