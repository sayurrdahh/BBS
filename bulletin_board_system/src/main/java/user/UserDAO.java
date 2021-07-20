package user;

import java.sql.*;

//ȸ�� �����ͺ��̽� ���̺� ������ �� �ֵ��� 
//�����ͺ��̽� ���� ��ü�� ���� 
//�����ͺ��̽����� ȸ�� ������ �ҷ����� �ְ� �ϴ� ����
public class UserDAO {

	private Connection conn; //���� ��ü
	private PreparedStatement pstmt; //sql������ �����Ű�� ���
	//sql������ ������ �� �ڸ��� '?'�� ȿ���Ѵ�. 
	private ResultSet rs; //������ ���� �� �ִ� ��ü 
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost/sayurrdahh";
			String dbID = "sayurrdahh";
			String dbPassword = "darismas8+";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			//conn��ü �ȿ� ���ӵ� ������ ���� �ȴ�! 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			//?�� �ش��ϴ� ���� userID�� �־��ش�
			rs = pstmt.executeQuery(); 
			//rs�� ����� �־���
			
			//rs����� �����ϸ�
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; //�α��� ����
				else
					return 0; //��й�ȣ ����ġ 
			}
			return -1; //���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //�����ͺ��̽� ����
	}
	
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ���� 
	}
	
}
