package com.javalec.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class joinOk
 */
@WebServlet("/joinOk")
public class joinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	//.. 데이터연결과 쿼리문 사용을 위한 변수 선언
	private Connection conn = null;
	private Statement stmt = null;
	private String name, id, pw, gender;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //.. doGet방식으로 데이터를 전송받았을 때 actionDo메소드로 간다
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			actionDo(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	 //.. doPost방식으로 데이터를 전송받았을 때 actionDo메소드로 간다
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			actionDo(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
		
		//.. 한글처리를 위한 선언
		request.setCharacterEncoding("UTF-8");
		
		name = request.getParameter("uname");
		id = request.getParameter("uid");
		pw = request.getParameter("upass");
		gender = request.getParameter("gender");
		
		//.. member1 테이블에 전송받은 데이터를 저장
		String query = "insert into member1 values('"+name+"','"+id+"','"+pw+"','"+gender+"')";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:SDUDB", "scott", "tiger");
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(query);
			
			//.. 데이터베이스에 데이터가 오류없이 입력됐다면 i는 1이 증가한다
			if(i==1) {
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			} else {
				System.out.println("insert fail");
				response.sendRedirect("join.jsp");
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
