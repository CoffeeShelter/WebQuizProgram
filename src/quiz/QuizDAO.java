package quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Vector;

public class QuizDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public QuizDAO() {
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
	
	public Vector<Quiz> SelectQuiz(String quiz_group) {
		String SQL = "select * from quiz where quiz_group=?";
		Vector<Quiz> quizVector = new Vector<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, quiz_group);
			System.out.println("퀴즈 선택: " + pstmt.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Quiz quiz = new Quiz();
				quiz.setQuiz_group(rs.getString("quiz_group"));
				quiz.setQuestion(rs.getString("question"));
				quiz.setAnswer(rs.getString("answer"));
				quizVector.add(quiz);
			}
			return quizVector;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public HashMap<String, Integer> SelectQuizList() {
		String SQL = "select quiz_group as '그룹 명', count(quiz_group) as '문제 개수' from quiz group by quiz_group";
		HashMap<String, Integer> quizGroup = new HashMap<>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			System.out.println("퀴즈 선택: " + pstmt.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				quizGroup.put(rs.getString("그룹 명"), rs.getInt("문제 개수"));
			}
			return quizGroup;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return quizGroup;
	}
}
