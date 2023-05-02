package wifi.data;

import java.sql.Date;

public class HistoryDTO {
    private int id;
    private String lat;
    private String lnt;
    private java.sql.Date searchAt;

    public HistoryDTO() {}

    public int getId() {
        return id;
    }

    public String getLat() {
        return lat;
    }

    public String getLnt() {
        return lnt;
    }

    public Date getSearchAt() {
        return searchAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public void setLnt(String lnt) {
        this.lnt = lnt;
    }

    public void setSearchAt(Date searchAt) {
        this.searchAt = searchAt;
    }
}
