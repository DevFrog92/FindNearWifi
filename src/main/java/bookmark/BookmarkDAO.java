package bookmark;

import common.JDBConnect;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class BookmarkDAO extends JDBConnect {
    public BookmarkDAO(ServletContext application) {
        super(application);
    }

    public int insertBookmark(BookmarkDTO dto) {
        int result = 0;
        String query = "insert into bookmarkWifi (name, mgrNo, groupName) VALUES (?, ?, ?);";
        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getMgrNo());
            psmt.setString(3, dto.getGroupName());
            result = psmt.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public BookmarkDTO getBookmarkItem(String mgrNo) {
        BookmarkDTO dto = new BookmarkDTO();
        String query = "select * from bookmarkWifi where mgrNo=?";

        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, mgrNo);
            rs = psmt.executeQuery();
            while(rs.next()) {
                dto.setMgrNo(rs.getString("mgrNo"));
                dto.setId(rs.getInt("id"));
                dto.setGroupName(rs.getString("groupName"));
                dto.setName(rs.getString("name"));
                dto.setCreatedAt(rs.getDate("createdAt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    public List<BookmarkDTO> getBookmarkList() {
        List<BookmarkDTO> list = new ArrayList<BookmarkDTO>();
        String query = "select * from bookmarkWifi order by id asc";

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while(rs.next()) {
                BookmarkDTO dto = new BookmarkDTO();

                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setMgrNo(rs.getString("mgrNo"));
                dto.setGroupName(rs.getString("groupName"));
                dto.setCreatedAt(rs.getDate("createdAt"));
                list.add(dto);
            }

        }catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int deleteBookmarkItem(String mgrNo) {
        int result = 0;
        String query = "delete from bookmarkWifi where mgrNo=?";

        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, mgrNo);
            result = psmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
