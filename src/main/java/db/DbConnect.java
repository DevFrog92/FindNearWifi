package db;

import dataScheme.UserTableScheme;
import java.sql.*;
import java.util.ArrayList;

public class DbConnect {
    private static Connection conn = null;

    public static void closeConnection() {
        if(conn != null) {
            try {
                conn.close();
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static Connection getConnection() {
        if (conn == null) {
            try {
                Class.forName("org.sqlite.JDBC");
                String url = "jdbc:sqlite:/Users/devfrog/Documents/Github/Mission01/FindWifi/test.db";
                conn = DriverManager.getConnection(url);
                System.out.println("DB 연결 성공");
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

    public ArrayList<UserTableScheme> getList() {
        ArrayList<UserTableScheme> list = new ArrayList<UserTableScheme>();
        Statement stmt;
        try {
            stmt = conn.createStatement();
            String sql = "SELECT * FROM user";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                // for test
                // TODO: just test case. will be remove.
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String join_date = rs.getString("join_date");
                UserTableScheme user = new UserTableScheme(name, age, join_date);
                list.add(user);
                System.out.println(list.toString());
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
