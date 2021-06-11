package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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
	
	public int delete(String id) {
		String SQL = "delete from user where id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  id);
			System.out.println("유저 조회: " + pstmt.toString());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public User search(String id) {
		String SQL = "Select * from user where id=?";
		User user = new User();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  id);
			System.out.println("유저 조회: " + pstmt.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setAnswer(rs.getString("answer"));
				user.setAuth(rs.getInt("auth"));
			}
			return user;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Vector<User> userList(){
		String SQL = "Select * from user";
		Vector<User> userVector = new Vector<>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			System.out.println("유저 조회: " + pstmt.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setAnswer(rs.getString("answer"));
				user.setAuth(rs.getInt("auth"));
				
				System.out.println("유저 이름" + user.getName());
				
				userVector.add(user);
			}
			return userVector;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Vector<User> userList(String name){
		String SQL = "Select * from user where name=?";
		Vector<User> userVector = new Vector<>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			System.out.println("유저 조회: " + pstmt.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setAnswer(rs.getString("answer"));
				user.setAuth(rs.getInt("auth"));
				
				System.out.println("유저 이름" + user.getName());
				
				userVector.add(user);
			}
			return userVector;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
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
		String SQL = "insert into user values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAnswer());
			pstmt.setInt(5, 0);
			System.out.println("회원가입: " + pstmt.toString());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(User user) {
		String SQL = "Update user set pw=?, name=?, answer=?, auth=? where id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getPw());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getAnswer());
			pstmt.setInt(4, user.getAuth());
			pstmt.setString(5,user.getId());
			System.out.println("회원정보 수정: " + pstmt.toString());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
