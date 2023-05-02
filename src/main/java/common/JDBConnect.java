package common;

import javax.servlet.ServletContext;
import java.sql.*;

public class JDBConnect {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    public JDBConnect(ServletContext application) {
        try {
            String driver = application.getInitParameter("SqliteDriver");
            Class.forName(driver);

            String url = application.getInitParameter("SqliteURL");
            conn = DriverManager.getConnection(url);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public JDBConnect(){}

    public void close() {
        try {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(psmt != null) psmt.close();
            if(conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
