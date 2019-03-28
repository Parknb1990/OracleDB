<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:SDUDB";
		String uid = "scott";
		String upass = "tiger";
		String sql = "insert into member values (id, pw, name, phone)";
	%>
	
	<%
		try {
			//.. jdbc 드라이버 로드
			Class.forName(driver);
			//.. 데이터베이스 연결
			con = DriverManager.getConnection(url, uid, upass);
			//.. insert문 실행을 위한 prepareStatement객체 선언
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "h");
			pstmt.setString(2, "51234");
			pstmt.setString(3, "park");
			pstmt.setString(4, "010-5235-1241");
			
			//.. id, pw, name, phone 데이터를 데이터베이스 삽입
			pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				out.println(e.toString()+"<br>");
			}
		
		}
	
	%>
	
	

</body>
</html>