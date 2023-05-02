package http;

import wifi.data.WifiApiJsonDTO;
import wifi.data.WIFIInfoDetailDTO;
import com.google.gson.Gson;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.ResponseBody;
import javax.servlet.ServletContext;
import java.io.*;
import java.util.*;

public class HttpRequest {
    private String apikey;
    private OkHttpClient client;
    private Gson gson;
    public HttpRequest() {
        client = new OkHttpClient();
        gson = new Gson();

       try {
           Properties properties = new Properties();
           InputStream inputStream = getClass().getResourceAsStream("/application-dev.properties");
           properties.load(inputStream);
           apikey = properties.getProperty("apiKey");
       }catch(IOException e) {
           e.printStackTrace();
       }
    }
    private String generateURL(ServletContext application, long start, long end) {
        String requestURL = application.getInitParameter("WIFIRequestURL");
        requestURL += apikey + "/json/TbPublicWifiInfo/" + start +"/" + end +"/";

        return requestURL;
    }
    private WifiApiJsonDTO requestAPI(String requestURL) {
        WifiApiJsonDTO wifiApiJsonDTO = new WifiApiJsonDTO();
        try {
            Request request = new Request.Builder().url(requestURL).build();
            ResponseBody response = client.newCall(request).execute().body();
            wifiApiJsonDTO = gson.fromJson(response.string(), WifiApiJsonDTO.class);
        } catch(Exception e) {
            e.printStackTrace();
        }

        return wifiApiJsonDTO;
    }
    public WIFIInfoDetailDTO[] getWifiInfoList(ServletContext application) {
        WIFIInfoDetailDTO[] wifiInfoDetailList = new WIFIInfoDetailDTO[0];
        String requestURL = generateURL(application,1, 1000);
        try {
            WifiApiJsonDTO wifiApiJsonDTO = requestAPI(requestURL);
            wifiInfoDetailList = wifiApiJsonDTO.getRow();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return wifiInfoDetailList;
    }
    public long getTotalWifiInfo(ServletContext application) {
        String requestURL = generateURL(application,1, 1000);
        WifiApiJsonDTO wifiApiJsonDTO = requestAPI(requestURL);
        return wifiApiJsonDTO.getTotalAmount();
    }

    public List<HashMap<String, String>> getNeatWifiInfoList(ServletContext application, String lat, String lnt, long totalAmount ) {
        long start = 0;
        long end = 999;
        long offset = 1000;
        long cnt = (long)Math.ceil((double) totalAmount / offset);
        double maxDist = 0;
        ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
        WIFIInfoDetailDTO[] wifiInfoDetailList = new WIFIInfoDetailDTO[0];

        while(cnt-- > 0) {
            String requestURL = generateURL(application, start, end);
            try {
                WifiApiJsonDTO wifiApiJsonDTO = requestAPI(requestURL);
                wifiInfoDetailList = wifiApiJsonDTO.getRow();

                for(WIFIInfoDetailDTO dto: wifiInfoDetailList ) {
                    HashMap<String, String> hm = new HashMap<String, String>();
                    String LAT = String.valueOf(Math.min(Double.parseDouble(dto.getLAT()), Double.parseDouble(dto.getLNT())));
                    String LNT = String.valueOf(Math.max(Double.parseDouble(dto.getLAT()), Double.parseDouble(dto.getLNT())));
                    double dist = Double.parseDouble(distance(Double.parseDouble(LAT), Double.parseDouble(LNT), Double.parseDouble(lat), Double.parseDouble(lnt)));
                    maxDist = Math.max(maxDist, dist);

                    if(list.size() > 20 && dist > maxDist) {
                        continue;
                    }

                    hm.put("X_SWIFI_MGR_NO", dto.getX_SWIFI_MGR_NO());
                    hm.put("X_SWIFI_WRDOFC", dto.getX_SWIFI_WRDOFC());
                    hm.put("X_SWIFI_MAIN_NM", dto.getX_SWIFI_MAIN_NM());
                    hm.put("X_SWIFI_ADRES1", dto.getX_SWIFI_ADRES1());
                    hm.put("X_SWIFI_ADRES2", dto.getX_SWIFI_ADRES2());
                    hm.put("X_SWIFI_INSTL_FLOOR", dto.getX_SWIFI_INSTL_FLOOR());
                    hm.put("X_SWIFI_INSTL_TY", dto.getX_SWIFI_INSTL_TY());
                    hm.put("X_SWIFI_INSTL_MBY", dto.getX_SWIFI_INSTL_MBY());
                    hm.put("X_SWIFI_SVC_SE", dto.getX_SWIFI_SVC_SE());
                    hm.put("X_SWIFI_CMCWR", dto.getX_SWIFI_CMCWR());
                    hm.put("X_SWIFI_CNSTC_YEAR", dto.getX_SWIFI_CNSTC_YEAR());
                    hm.put("X_SWIFI_INOUT_DOOR", dto.getX_SWIFI_INOUT_DOOR());
                    hm.put("X_SWIFI_REMARS3", dto.getX_SWIFI_REMARS3());
                    hm.put("LNT", LNT);
                    hm.put("LAT", LAT);
                    hm.put("WORK_DTTM", dto.getWORK_DTTM());
                    hm.put("DIST", String.valueOf(dist));
                    list.add(hm);
                }
            } catch(Exception e) {
                e.printStackTrace();
            }

            start += offset;
            end += offset;
            Collections.sort(list, new Comparator<HashMap<String, String>>() {
                public int compare(HashMap<String, String> o1, HashMap<String, String> o2) {
                    Double dist1 =  Double.parseDouble(o1.get("DIST"));
                    Double dist2 =  Double.parseDouble(o2.get("DIST"));
                    return dist1.compareTo(dist2);
                }
            });
        }
        return list.subList(0, 20);
    }

    // referenced https://www.geodatasource.com/developers/java
    private String distance(double lat1, double lon1, double lat2, double lon2) {
        if ((lat1 == lat2) && (lon1 == lon2)) {
            return "0";
        }

        else {
            double theta = lon1 - lon2;
            double dist = Math.sin(Math.toRadians(lat1)) * Math.sin(Math.toRadians(lat2)) + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.cos(Math.toRadians(theta));
            dist = Math.acos(dist);
            dist = Math.toDegrees(dist);
            dist = dist * 60 * 1.1515;
            dist = dist * 1.609344;

            return String.valueOf(dist).substring(0, 7);
        }
    }
}
