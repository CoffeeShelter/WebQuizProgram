package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/webquiz";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String pw) {
		String SQL = "Select pw from user where id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  id);
			System.out.println("로그인: " + pstmt.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					return 1;	// 로그인 성공
				}else {
					return 0;	// 비밀번호 불일치
				}
			}
			return -1;	// 아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;	// 데이터 베이스 오류
	}
	
	public int join(User user) {
		String SQL = "insert into user values (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAnswer());
			System.out.println("회원가입: " + pstmt.toString());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
