package bookmark;

import common.JDBConnect;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class BookmarkGroupDAO extends JDBConnect {
    public BookmarkGroupDAO(ServletContext application) {
        super(application);
    }

    public int insertBookmarkGroup(BookmarkGroupDTO groupDTO) {
        int result = 0;
        String query = "insert into bookmarkGroup (name, level) VALUES (? ,?)";
        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, groupDTO.getName());
            psmt.setString(2, groupDTO.getLevel());
            result = psmt.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<BookmarkGroupDTO> getBookmarkGroupList() {
        List<BookmarkGroupDTO> list = new ArrayList<BookmarkGroupDTO>();
        String query = "select * from bookmarkGroup order by level asc";
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while(rs.next()) {
                BookmarkGroupDTO dto = new BookmarkGroupDTO();

                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setLevel(rs.getString("level"));
                dto.setCreatedAt(rs.getDate("createdAt"));
                dto.setEditedAt(rs.getDate("editedAt"));

                list.add(dto);
            }

        }catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public BookmarkGroupDTO getBookMarkGroupItem(int id) {
        BookmarkGroupDTO dto = new BookmarkGroupDTO();
        String query = "select * from bookmarkGroup where id=?";
        try {
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, id);
            rs = psmt.executeQuery();

            while(rs.next()) {
                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setLevel(rs.getString("level"));
                dto.setCreatedAt(rs.getDate("createdAt"));
                dto.setEditedAt(rs.getDate("editedAt"));
            }

        }catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    public int updateBookmarkGroupItem(BookmarkGroupDTO dto) {
        int result = 0;
        String query = "update bookmarkGroup "
                + " set "
                + " name=? ,"
                + " level=? ,"
                + " editedAt=datetime('now', 'localtime') "
                + " where id=? ";
        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getLevel());
            psmt.setInt(3, dto.getId());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public int deleteBookmarkGroupItem(int id) {
        int result = 0;
        String query = "delete from bookmarkGroup where id=?";

        try {
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, id);
            result = psmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
