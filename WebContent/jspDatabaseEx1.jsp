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
	<!-- �������� ���� -->
	<%!
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:SDUDB";
		String uid = "scott";
		String pw = "tiger";
		//.. member���̺��� id, pw, name, phone �޾ƿ���
		String query = "select id, pw, name, phone from member";
	%>
	
	<%
		try {
			//.. jdbc ����̹� �ε�
			Class.forName(driver);
			//.. �����ͺ��̽� ����
			conn = DriverManager.getConnection(url, uid, pw);
			//.. ������ ������ ���� Statement��ü ����
			stmt = conn.createStatement();
			//.. ���� ������ �����ü�� ����
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