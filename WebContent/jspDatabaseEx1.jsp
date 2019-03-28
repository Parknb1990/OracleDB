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
	<!-- 전역변수 선언 -->
	<%!
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:SDUDB";
		String uid = "scott";
		String pw = "tiger";
		//.. member테이블에서 id, pw, name, phone 받아오기
		String query = "select id, pw, name, phone from member";
	%>
	
	<%
		try {
			//.. jdbc 드라이버 로드
			Class.forName(driver);
			//.. 데이터베이스 연결
			conn = DriverManager.getConnection(url, uid, pw);
			//.. 쿼리문 실행을 위해 Statement객체 선언
			stmt = conn.createStatement();
			//.. 쿼리 실행의 결과객체를 받음
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				
				out.println("id : "+id+" pw : "+pw+" name : "+name+" phone : "+phone+"<br>");
			}
		} catch (SQLException e) {
			out.println(e.toString());
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				out.println(e.toString());
			}
		}
		
	%>
	

</body>
</html>