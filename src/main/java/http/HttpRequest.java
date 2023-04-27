package http;

import api.ApiStructure;
import api.WIFIInfoDetail;
import com.google.gson.Gson;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.ResponseBody;

import java.util.Arrays;

public class HttpRequest {
    public HttpRequest() {}

    public WIFIInfoDetail[] get(String requestURL) {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(requestURL)
                .build();
        try {
            ResponseBody response = client.newCall(request).execute().body();
            Gson gson = new Gson();
            ApiStructure apiStructure = gson.fromJson(response.string(), ApiStructure.class);
            return apiStructure.getRow();
        } catch(Exception e) {
            System.err.println(e.toString());
        }

        return null;
    }
}
