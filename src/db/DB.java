package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class DB {

	private Connection conn;

	public DB() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/db";
			String dbID = "root";
			String dbPassword = "password";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {

		}
	}

	public ArrayList<String> listUser() {
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select * from user";
		try {
			PreparedStatement pstmt;
			ResultSet rs;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			return null;
		}
		return list;
	}

	public boolean validateUser(String id, String pw) {
		String sql = "select * from user where id = ? and pw = ?";
		try {
			PreparedStatement pstmt;
			ResultSet rs;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			return false;
		}
	}

	public boolean checkUser(String id) {
		String sql = "select * from user where id = ?";
		try {
			PreparedStatement pstmt;
			ResultSet rs;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			return false;
		}
	}

	public String addUser(String id, String pw) {
		if (checkUser(id)) {
			return "Such user already exists";
		}
		String sql = "insert user(id,pw) values(?,?)";
		try {
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();
			return null;
		} catch (SQLException e) {
			return e.getMessage();
		}
	}

	public String addPost(String title, String content) {
		String sql = "insert post(title,content) values(?,?)";
		try {
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			return null;
		} catch (SQLException e) {
			return e.getMessage();
		}
	}

	public HashMap<Integer, String> listPost() {
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		String sql = "select * from post";
		try {
			PreparedStatement pstmt;
			ResultSet rs;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.put(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
		return list;
	}

	public HashMap<Integer, String> searchPost(String query) {
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		String sql = "select * from post where match(title) against (?) or match(content) against (?)";
		try {
			PreparedStatement pstmt;
			ResultSet rs;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, query);
			pstmt.setString(2, query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.put(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
		return list;
	}

	public String[] getPost(String id) {
		try {
			String sql = "select * from post where id = ?";
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (!rs.next())
				return null;
			String[] output = { rs.getString(2), rs.getString(3) };
			return output;
		} catch (SQLException e) {
			return null;
		}
	}
}