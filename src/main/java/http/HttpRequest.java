package http;

import java.io.IOException;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
public class HttpRequest {
    public HttpRequest() {}

    public void get(String requestURL) {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(requestURL)
                .build();
//
        try {
            Response response = client.newCall(request).execute();
        } catch(Exception e) {
            System.err.println(e.toString());
        }
    }
}
