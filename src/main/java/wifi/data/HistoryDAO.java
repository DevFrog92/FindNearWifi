package wifi.data;

import common.JDBConnect;
import javax.servlet.ServletContext;
import java.util.List;
import java.util.Vector;

public class HistoryDAO extends JDBConnect {
    public HistoryDAO(ServletContext application) {
        super(application);
    }

    public int insertHistory(String lat, String lnt) {
        int result = 0;

        try {
            String query = "insert into history "
                    + " (lat, lnt) "
                    + " values "
                    + " (?, ?)";

            psmt = conn.prepareStatement(query);
            psmt.setString(1, lat);
            psmt.setString(2, lnt);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<HistoryDTO> getHistoryList() {
        List<HistoryDTO> list = new Vector<HistoryDTO>();
        String query = "select * from history order by id desc";

        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while(rs.next()) {
                HistoryDTO dto = new HistoryDTO();
                dto.setId(rs.getInt("id"));
                dto.setLat(rs.getString("lat"));
                dto.setLnt(rs.getString("lnt"));
                dto.setSearchAt(rs.getDate("searchAt"));
                list.add(dto);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int deleteHistory(String id) {
        int result = 0;
        try {
            String query = "delete from history where id=?";
            psmt = conn.prepareStatement(query);
            psmt.setString(1, id);
            result = psmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return  result;
    }
}
