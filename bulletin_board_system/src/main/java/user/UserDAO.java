package user;

import java.sql.*;

//회원 데이터베이스 테이블에 접근할 수 있도록 
//데이터베이스 접근 객체의 약자 
//데이터베이스에서 회원 정보를 불러오고 넣고 하는 역할
public class UserDAO {

	private Connection conn; //접근 객체
	private PreparedStatement pstmt; //sql구문을 실행시키는 기능
	//sql문에서 변수가 들어갈 자리는 '?'로 효시한다. 
	private ResultSet rs; //정보를 담을 수 있는 객체 
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost/sayurrdahh";
			String dbID = "sayurrdahh";
			String dbPassword = "darismas8+";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			//conn객체 안에 접속된 정보가 담기게 된다! 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			//?에 해당하는 데에 userID를 넣어준다
			rs = pstmt.executeQuery(); 
			//rs에 결과를 넣어줌
			
			//rs결과가 존재하면
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치 
			}
			return -1; //아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
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
		return -1; //데이터베이스 오류 
	}
	
}
