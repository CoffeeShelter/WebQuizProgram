package record;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class RecordDAO {
	private Connection conn;
	private Statement stmt;

	public RecordDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/webquiz";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<Record> getRecord(String id) {
		Vector<Record> records = new Vector<>();
		String SQL = "Select * from record where id=\'" + id + "\'";
		try {
			stmt = conn.createStatement();
			System.out.println("getRecord: " + SQL);

			ResultSet rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				Record record = new Record();
				record.setId(rs.getString("id"));
				record.setGroupName(rs.getString("groupName"));
				record.setPercent(rs.getString("percent"));
				record.setTotalCount(rs.getInt("totalCount"));
				record.setCorrectCount(rs.getInt("correctCount"));

				records.add(record);
			}

			return records;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public Record getOneRecord(String id, String quizGroup) {
		Record record = null;
		String SQL = "select * from record where id=\'" + id + "\'" + " and groupName=\'" + quizGroup + "\'";
		try {
			stmt = conn.createStatement();

			System.out.println("getOneRecord: " + SQL);

			ResultSet rs = stmt.executeQuery(SQL);

			if (rs.next()) {
				record = new Record();
				
				record.setId(rs.getString("id"));
				record.setGroupName(rs.getString("groupName"));
				record.setPercent(rs.getString("percent"));
				record.setTotalCount(rs.getInt("totalCount"));
				record.setCorrectCount(rs.getInt("correctCount"));
				
				return record;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public int setRecord(Record record) {
		String SQL = String.format("insert into record values (\'%s\', \'%s\', \'%s\', %d, %d)", record.getId(),
				record.getGroupName(), record.getPercent(), record.getTotalCount(), record.getCorrectCount());
		try {
			stmt = conn.createStatement();

			System.out.println("setRecord: " + SQL);

			return stmt.executeUpdate(SQL);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}

	public int updateRecord(Record record) {
		String SQL = String.format("update record set totalCount=%d, correctCount=%d, percent=\'%s\' where id=\'%s\' and groupName=\'%s\'",
				record.getTotalCount(), record.getCorrectCount(), record.getPercent(), record.getId(), record.getGroupName());
		try {
			stmt = conn.createStatement();

			System.out.println("updateRecord: " + SQL);

			return stmt.executeUpdate(SQL);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}
}
